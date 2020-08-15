//
//  OrderList.swift
//  Order a Drink
//
//  Created by Omar on 7/1/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI
import Foundation
import Combine

class UserSettings: ObservableObject {
//UserDefaults updates the View
    @Published var orders: Array<Dictionary<String, Any>>
    
    init() {
        self.orders = (UserDefaults.standard.object(forKey: "orders") as? Array) ?? []
    }
}

struct DrinkItem: Identifiable {
    var id = UUID()
    
    var drinkName: String
    var drinkImage: String
    var drinkDescription: String
    var transportationString: String
    var transportationInt: Int
    var time: String
    var name: String
    var ice: Bool
}

var drinkItems: [DrinkItem] = []

func makeList() -> some View {
    
    drinkItems = []
    
    let userOrders: Array<Dictionary> = UserSettings().orders
    
    var transportString: String
    
    for currentOrder: Dictionary in userOrders {
        if currentOrder["transport"] as! Int == 1 {
            transportString = "Pickup"
            print("Setting pickup")
        } else if currentOrder["transport"] as! Int == 2 {
            transportString = "Delivery"
            print("Setting delivery")
        } else {
            transportString = "Unknown"
        }
        
        drinkItems.append(DrinkItem(drinkName: currentOrder["drink"] as! String, drinkImage: currentOrder["image"] as! String, drinkDescription: currentOrder["description"] as! String, transportationString: transportString, transportationInt: currentOrder["transport"] as! Int, time: currentOrder["time"] as! String, name: currentOrder["name"] as! String, ice: currentOrder["ice"] as! Bool))
        
        // print("drinkItems is \(drinkItems)")
        // Just use breakpoints, dummy
    }
    
    return listView(transportInt: 0, bindingName: "Unknown Name", bindingIce: false)
        
}

struct listView: View {
    
    @State var showingDetail = false
    @State var transportInt: Int
    @State var bindingName: String
    @State var bindingIce: Bool
    
    var body: some View {
        List(drinkItems, id: \.id) { currentDrink in
            Button(action: {self.showingDetail.toggle()}) {
                HStack {
                VStack(alignment: .leading) {
                    Text(currentDrink.drinkName)
                        .fontWeight(.semibold)
                        .font(.headline)
//                    Text(currentDrink.drinkDescription)
//                        .font(.subheadline)
                    Text("Order for \(currentDrink.name)")
                        .font(.subheadline)
                    Spacer()
                    Divider()
                    Text("Ordered at \(currentDrink.time)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Transportation: \(currentDrink.transportationString)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(currentDrink.drinkImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                }
            }
            //MARK: Receipt Sheet
            .sheet(isPresented: self.$showingDetail) {
                NavigationView {
                    Form {
                    Section(header: Text("DRINK")) {
                        Text(currentDrink.drinkName)
                            .font(.headline)
                        Text(currentDrink.drinkDescription)
                        Image(currentDrink.drinkImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 300)
                            .cornerRadius(20)
                    }
                    Section(header: Text("ORDER")) {
                        TextField("Name", text: (self.$bindingName))
                            .disabled(true)
                        //Disabled because it's the receipt
                        Toggle(isOn: (self.$bindingIce)) {
                            Text("Ice")
                        }
                            .disabled(true)
                        //Disabled because it's the receipt
                        Picker(selection: self.$transportInt, label: Text("Choose a way to get your drink")) {
                            Text("Pickup").tag(1)
                            Text("Delivery").tag(2)
                        }
                            .pickerStyle(SegmentedPickerStyle())
                            .disabled(true)
                        Text("Ordered at \(currentDrink.time)")
                        //Disabled because it's the receipt
                    }
                        .onAppear(perform: {
                            self.bindingName = "Order for: \(currentDrink.name)"
                            self.bindingIce = currentDrink.ice
                            self.transportInt = currentDrink.transportationInt
                        })
                    }
                .navigationBarTitle("Receipt")
                .navigationBarItems(leading:
                    Button("Close") {
                        self.showingDetail = false
                    }
                )
                }
        }
        //End receipt
    }
}
}

struct OrderList: View {
    
    @State var showingDetail = false
    
    var body: some View {
        makeList()
    }
}

struct OrderList_Previews: PreviewProvider {
    static var previews: some View {
        OrderList()
    }
}
