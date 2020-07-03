//
//  AppView.swift
//  Order a Drink
//
//  Created by Omar on 7/1/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        //2 tabs: one for ordering/browsing menu, one for seeing your orders
        TabView {
            //Main menu View below
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    //list.dash symbol in Tab with name "Menu"
                    Text("Menu")
                }
            //My orders View below
            OrderContentView()
                .tabItem {
                    Image(systemName: "pencil.and.ellipsis.rectangle")
                    //pencil.and.ellipsis.rectangle symbol in Tab with name "Orders"
                    Text("Orders")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
