//
//  ConfirmView.swift
//  Order a Drink
//
//  Created by Omar on 7/2/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI
import UserNotifications

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
                        .frame(width: 300, height: 300)
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
                    print("UserDefaults set to not ask about notifs anymore")
                    if self.selectedTransport < 1 {
                        self.alertVar = Alert(title: Text(""), message: Text("Please select pickup or delivery."), dismissButton: .default(Text("Got it!")))
                    } else {
                        if self.name == "" {
                            self.alertVar = Alert(title: Text(""), message: Text("Please type in your name."), dismissButton: .default(Text("Got it!")))
                        } else {
                            //Get current orders (if nil, orders is []
                            var currentOrders: Array = UserDefaults.standard.object(forKey: "orders") as? Array ?? []
                            print("Current orders: \(currentOrders)")
                            //Get time and set it to a var
                            let time = getCurrentTime()
                            //Create a dictionary for the drink
                            let newOrder = ["drink": globalDrink, "description": globalDescription, "image": globalImageName, "transport": self.selectedTransport, "ice": self.iceBool, "time": time] as [String : Any]
                            currentOrders.append(newOrder)
                        UserDefaults.standard.set(currentOrders, forKey: "orders")
                        self.alertVar = Alert(title: Text("Submitted!"), message: Text("Yay"), dismissButton: .default(Text("Got it!")) {
                                self.viewIsPresented = false
                            })
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
            print("Notif alert should show now")
            self.notifAlertVar = Alert(title: Text("Push Notifications"), message: Text("Would you like to receive notifications when your order is ready?"), primaryButton: .default(Text("Yes!")) {
                //Runs function to register for push notifications
                registerForPushNotifications()
            },
                secondaryButton: .default(Text("No thanks")))
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

/* struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView()
    }
}
*/
