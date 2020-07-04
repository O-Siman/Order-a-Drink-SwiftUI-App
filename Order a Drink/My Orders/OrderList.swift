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
    @Published var orders: Array<Dictionary<String, Any>> {
    //If the orders variable is changed, then set user defaults to that value.
        didSet {
            UserDefaults.standard.set(orders, forKey: "orders")
        }
    }
    
    init() {
        self.orders = (UserDefaults.standard.object(forKey: "orders") as? Array) ?? []
    }
}

struct DrinkItem: Identifiable {
    var id = UUID()
    
    var drinkName: String
    var drinkImage: String
    var drinkDescription: String
    var transportation: String
    var time: String
}

var drinkItems: [DrinkItem] = []

func makeList() -> some View {
    
    let userOrders: Array<Dictionary> = UserSettings().orders
    
    // var drinkNames: Array<String>
    // var drinkImages: Array<String>
    
    var transportString: String
    
    for currentOrder: Dictionary in userOrders {
        // drinkNames.append(currentOrder["drink"] as! String)
        // drinkImages.append(currentOrder["image"] as! String)
        if currentOrder["transport"] as! Int == 1 {
            transportString = "Pickup"
            print("Setting pickup")
        } else if currentOrder["transport"] as! Int == 2 {
            transportString = "Delivery"
            print("Setting delivery")
        } else {
            transportString = "Unknown"
        }
        print("Transport is \(currentOrder["transport"] ?? "Unknown")")
        
        drinkItems.append(DrinkItem(drinkName: currentOrder["drink"] as! String, drinkImage: currentOrder["image"] as! String, drinkDescription: currentOrder["description"] as! String, transportation: transportString, time: currentOrder["time"] as! String))
        
        print("drinkItems is \(drinkItems)")
    }
    
    return listView()
        
}

struct listView: View {
    
    @State var showingDetail = false
    
    var body: some View {
        List(drinkItems, id: \.id) { currentDrink in
            Button(action: {self.showingDetail.toggle()}) {
                HStack {
                VStack(alignment: .leading) {
                    Text(currentDrink.drinkName)
                        .fontWeight(.semibold)
                        .font(.headline)
                    Text(currentDrink.drinkDescription)
                        .font(.subheadline)
                    Spacer()
                    Divider()
                    Text("Ordered at \(currentDrink.time)")
                        .font(.subheadline)
                    Text("Transportation: \(currentDrink.transportation)")
                        .font(.subheadline)
                }
                Spacer()
                Image(currentDrink.drinkImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                }
            }
            .sheet(isPresented: self.$showingDetail) {
                ConfirmView(viewIsPresented: self.$showingDetail)
            }
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
