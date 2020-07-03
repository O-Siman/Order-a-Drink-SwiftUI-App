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
        //VStack of Splash and list
        VStack {
            OrdersSplash()
                //Splash view can go into safe area, constant height for all devices is 50. Math for safe area is in OrdersSplash.swift
                .edgesIgnoringSafeArea(.top)
                .frame(height: 50)
            OrderList()
            //OrderList View
        }
    }
}

struct OrderContentView_Previews: PreviewProvider {
    static var previews: some View {
        OrderContentView()
    }
}
