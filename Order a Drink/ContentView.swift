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
            GeometryReader { geometry in
            Drinks_Splash()
                .frame(height: geometry.size.height)
            }
            Drink_List()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
