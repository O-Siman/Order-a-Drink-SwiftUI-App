//
//  Drinks Splash.swift
//  Order a Drink
//
//  Created by Omar on 6/30/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct Drinks_Splash: View {
    var body: some View {
        VStack {
        Text("Choose a Drink Category")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(.top)
        GeometryReader { geometry in
            Image("Drinks Splash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geometry.size.width - 30)
                .clipped()
                .cornerRadius(20)
            }
        }
    }
}

struct Drinks_Splash_Previews: PreviewProvider {
    static var previews: some View {
        Drinks_Splash()
    }
}
