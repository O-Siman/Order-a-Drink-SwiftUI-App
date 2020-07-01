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
        VStack {
        OrdersSplash()
            .frame(height: 120)
            .edgesIgnoringSafeArea(.top)
        Spacer()
        }
    }
}

struct OrderContentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderContentView()
    }
}
