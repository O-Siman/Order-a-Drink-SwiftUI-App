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
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(self.varColorScheme == .dark ? 1.0 : 0.6)
            Text("My Orders")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, geometry.safeAreaInsets.top)
            }
        }
    }
}

struct OrdersSplash_Previews: PreviewProvider {
    static var previews: some View {
        OrdersSplash()
    }
}
