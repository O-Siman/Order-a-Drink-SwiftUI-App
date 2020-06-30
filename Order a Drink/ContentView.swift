//
//  ContentView.swift
//  Order a Drink
//
//  Created by Omar on 6/29/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Drinks_Splash()
                .frame(height: 300)
            Drink_List()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
