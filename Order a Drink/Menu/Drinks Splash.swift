//
//  Drinks Splash.swift
//  Order a Drink
//
//  Created by Omar on 6/30/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct Drinks_Splash: View {
    var screenWidth = 0.0
    var body: some View {
        VStack(alignment: .center) {
            Text("Order a Drink!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.top)
            Image("Drinks Splash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
                .cornerRadius(20)
                .shadow(radius: 5)
        }
    }
}

struct Drinks_Splash_Previews: PreviewProvider {
    static var previews: some View {
        Drinks_Splash()
    }
}
