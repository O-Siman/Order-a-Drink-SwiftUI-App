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
}

func makeList() -> some View {
    
    let userOrders: Array<Dictionary> = UserSettings().orders
    
    // var drinkNames: Array<String>
    // var drinkImages: Array<String>
    
    var drinkItems: [DrinkItem] = []
    
    for currentOrder: Dictionary in userOrders {
        // drinkNames.append(currentOrder["drink"] as! String)
        // drinkImages.append(currentOrder["image"] as! String)
        drinkItems.append(DrinkItem(drinkName: currentOrder["drink"] as! String, drinkImage: currentOrder["image"] as! String))
    }
    
    return List(drinkItems, id: \.drinkName) { currentDrink in
        HStack {
            Image(currentDrink.drinkImage)
            Text(currentDrink.drinkName)
        }
    }
}

struct OrderList: View {
    
    var body: some View {
        makeList()
    }
}

struct OrderList_Previews: PreviewProvider {
    static var previews: some View {
        OrderList()
    }
}
