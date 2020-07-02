//
//  OrderContentView.swift
//  Order a Drink
//
//  Created by Omar on 7/1/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct OrderContentView: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
            OrdersSplash()
                .edgesIgnoringSafeArea(.top)
                .frame(height: geometry.safeAreaInsets.top + 25)
                OrderList()
            Spacer()
            }
        }
    }
}

struct OrderContentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderContentView()
    }
}
