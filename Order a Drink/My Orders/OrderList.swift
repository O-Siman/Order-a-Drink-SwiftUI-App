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
    @Published var orders: Array<String> {
        didSet {
            UserDefaults.standard.set(orders, forKey: "orders")
        }
    }
    
    init() {
        self.orders = UserDefaults.standard.object(forKey: "orders") as? Array ?? ["hi", "hello"]
    }
}

func makeList() -> some View {
    let userOrders = UserSettings().orders
    
    return List(userOrders, id: \.self) { order in
        Image("PlaceholderImage")
        Text(order)
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
