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
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            OrderContentView()
                .tabItem {
                    Image(systemName: "pencil.and.ellipsis.rectangle")
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
