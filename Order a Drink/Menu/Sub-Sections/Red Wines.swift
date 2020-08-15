//
//  Red Wines.swift
//  Order a Drink
//
//  Created by Omar on 6/30/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct Red_Wines: View {
    var body: some View {
        List {
            Detail_Item(drink: "Chianti Classico", description: "This dry and fruity wine is perfect with its red cherry and plum aromas. It’s fresh and elegant, everything you would want in a wine.", imageName: "ChiantiClassico", showingDetail: false)
        }
        .navigationBarTitle("Red Wines")
    }
}

struct Red_Wines_Previews: PreviewProvider {
    static var previews: some View {
        Red_Wines()
    }
}
