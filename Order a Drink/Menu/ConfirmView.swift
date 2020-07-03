//
//  ConfirmView.swift
//  Order a Drink
//
//  Created by Omar on 7/2/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct ConfirmView: View {
    @ObservedObject private var keyboard = KeyboardResponder()
    
    @State var name: String = ""
    @State private var selectedTransport = 0
    @State private var iceBool = false
    @State private var showingAlert = false
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
                    //Will show alert every time it's pressed
                    self.showingAlert = true
                    if self.selectedTransport < 1 {
                        self.alertVar = Alert(title: Text(""), message: Text("Please select pickup or delivery."), dismissButton: .default(Text("Got it!")))
                    } else {
                        if self.name == "" {
                            self.alertVar = Alert(title: Text(""), message: Text("Please type in your name."), dismissButton: .default(Text("Got it!")))
                        } else {
                            //Get current orders (if nil, orders is []
                            var currentOrders: Array = UserDefaults.standard.object(forKey: "orders") as? Array ?? []
                            print("Current orders: \(currentOrders)")
                            //Create a dictionary for the drink
                            var newOrder = ["drink": globalDrink, "description": globalDescription, "image": globalImageName, "transport": self.selectedTransport, "ice": self.iceBool] as [String : Any]
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
            .padding(.bottom, keyboard.currentHeight)
            .edgesIgnoringSafeArea(.bottom)
            .animation(.easeOut(duration: 0.16))
    }
}
}

/* struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView()
    }
}
*/
