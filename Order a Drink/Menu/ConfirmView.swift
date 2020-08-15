//
//  ConfirmView.swift
//  Order a Drink
//
//  Created by Omar on 7/2/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI
import Alamofire
import UserNotifications
import PushNotifications

struct ConfirmView: View {
    @ObservedObject private var keyboard = KeyboardResponder()
    
    @State var name: String = ""
    @State private var selectedTransport = 0
    @State private var iceBool = false
    @State private var showingAlert = false
    @State private var notifAlertShowing = false
    @State private var notifAlertVar: Alert?
    @State private var alertVar: Alert?
    
    @Binding var viewIsPresented: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("DRINK")) {
                    Text(globalDrink)
                        .font(.headline)
                    Text(globalDescription)
                    Image(globalImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300)
                        .cornerRadius(20)
                }
                Section(header: Text("ORDER")) {
                    TextField("Enter your Name", text: $name)
                    Toggle(isOn: $iceBool) {
                        Text("Ice")
                    }
                    Picker(selection: $selectedTransport, label: Text("Choose a way to get your drink")) {
                        Text("Pickup").tag(1)
                        Text("Delivery").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                //MARK: Submit Button
                Button(action: {
                    //Will show an alert no matter what happens below
                    self.showingAlert = true

                    if self.selectedTransport < 1 {
                        self.alertVar = Alert(title: Text(""), message: Text("Please select pickup or delivery."), dismissButton: .default(Text("Got it!")))
                    } else {
                        if self.name == "" {
                            self.alertVar = Alert(title: Text(""), message: Text("Please type in your name."), dismissButton: .default(Text("Got it!")))
                        } else {
                            //Get current orders (if nil, orders is []
                            var currentOrders: Array = UserDefaults.standard.object(forKey: "orders") as? Array ?? []
                            //Get time and set it to a var
                            let time = getCurrentTime()
                            //Create a dictionary for the drink
                            let newOrder = ["drink": globalDrink, "description": globalDescription, "image": globalImageName, "transport": self.selectedTransport, "ice": self.iceBool, "time": time, "name": self.name] as [String : Any]
                            //Alert to say it's submitting
                            self.alertVar = Alert(title: Text("Submitting..."))
                            //Set up waiting
                            let group = DispatchGroup()
                            group.enter()
                            DispatchQueue.main.async {
                                uploadOrder(orderToUpload: newOrder) { (result) -> () in
                                    if result != "Error" {
                                        try? pushNotifications.addDeviceInterest(interest: result)
                                        print("Added interest: " + result)
                                        self.alertVar = Alert(title: Text("Order Placed!"), message: Text("Check the orders tab for more information."), dismissButton: .default(Text("Got it!")) {
                                        self.viewIsPresented = false
                                        })
                                    } else {
                                        self.alertVar = Alert(title: Text("Unable to submit order"), message: Text("Make sure you have an internet connection."), dismissButton: .default(Text("Got it!")) {
                                        self.viewIsPresented = false
                                        })
                                    }
                                }
                                
                                group.leave()
                            }
                            group.notify(queue: .main) {
                                currentOrders.append(newOrder)
                                UserDefaults.standard.set(currentOrders, forKey: "orders")
                            }
                        }
                    }
                }) {
                    Text("Place Order")
                }
                .alert(isPresented: $showingAlert) {
                    (alertVar!)
                }
        .navigationBarTitle("New Order")
        .navigationBarItems(leading:
            Button("Cancel") {
                self.viewIsPresented = false
            }
        )
        }
            .alert(isPresented: $notifAlertShowing) {
                (notifAlertVar!)
            }
            .padding(.bottom, keyboard.currentHeight)
            .edgesIgnoringSafeArea(.bottom)
            .animation(.easeOut(duration: 0.16))
    }
        //MARK: Push Notifications
        .onAppear(perform: {
            if (UserDefaults.standard.object(forKey: "push") != nil) {} else {
            self.notifAlertShowing = true
            self.notifAlertVar = Alert(title: Text("Push Notifications"), message: Text("Would you like to receive notifications when your order is ready?"), primaryButton: .default(Text("No thanks")),
               secondaryButton: .default(Text("Yes!")) {
                // Runs function to register for push notifications
                registerForPushNotifications()
                
                pushNotifications.registerForRemoteNotifications()
            })
        }
        UserDefaults.standard.set(true, forKey: "push")
            
        DispatchQueue.main.async {
          UIApplication.shared.registerForRemoteNotifications()
        }
        })
}
}

func getCurrentTime() -> String {
    let currentDateTime = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    
    return formatter.string(from: currentDateTime)
}

//More notif functions
func registerForPushNotifications() {
  UNUserNotificationCenter.current() // 1
    .requestAuthorization(options: [.alert, .sound, .badge]) { // 2
      granted, error in
      print("Permission granted: \(granted)") // 3
  }
}

func uploadOrder(orderToUpload: [String: Any], onSuccess: @escaping (String) -> ()) {
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
      "secret-key": "$2b$10$/Co03nL8gBoLVFGv8ETFrOgHD9zpmfQ6YP.IqWBhUwyvtFSNjTxEu",
      "collection-id": "5f04d06f5d4af74b01283377"
    ]
    
    var result: [String: Any] = [String: Any]()
    var id: String = "Error"
    
    
    AF.request("https://api.jsonbin.io/b", method: .post, parameters: orderToUpload, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
        if response.value as? [String: Any] == nil {
            print("No internet?")
            onSuccess("Error")
        } else {
            result = response.value! as! [String: Any]
            id = result["id"] as! String
        }
        //        print("Result is: \(result)")
        print("submitted and id is: \(id)")
        onSuccess(id)
    }
    
}

/* struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView()
    }
}
*/
