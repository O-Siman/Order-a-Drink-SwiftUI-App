//
//  ContentView.swift
//  Order a Drink
//
//  Created by Omar on 6/29/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var varColorScheme
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                ZStack(alignment: .top) {
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(height: geometry.size.width * 0.7)
                            .edgesIgnoringSafeArea(.top)
                            .opacity(self.varColorScheme == .dark ? 1.0 : 0.6)
                        Drinks_Splash()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(.horizontal)
                    }
                Drink_List()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
