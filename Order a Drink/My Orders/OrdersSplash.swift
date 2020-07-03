//
//  OrdersSplash.swift
//  Order a Drink
//
//  Created by Omar on 7/1/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct OrdersSplash: View {
    @Environment(\.colorScheme) var varColorScheme
    //colorScheme saved to varColorScheme
    var body: some View {
        GeometryReader { geometry in
        //GeometryReader at top level bc it's greedy
            ZStack(alignment: .top) {
            //We want the Rectangle behind the Text
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                //Gradient red at top left, blue at bottom right of *wherever the View is constrained to*
                .opacity(self.varColorScheme == .dark ? 1.0 : 0.6)
                //Will be 1.0 opacid in dark mode and only 0.6 in light
            Text("My Orders")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, geometry.safeAreaInsets.top)
                //GeometryReader is read here, adds padding for the text for safe area (so that we don't have to use a georeader in OrdersContentView.swift
            }
        }
    }
}

struct OrdersSplash_Previews: PreviewProvider {
    static var previews: some View {
        OrdersSplash()
    }
}
