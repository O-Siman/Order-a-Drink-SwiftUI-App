//
//  Sparkling Wines.swift
//  Order a Drink
//
//  Created by Omar on 7/1/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct Sparkling_Wines: View {
    var body: some View {
        List {
            Detail_Item(drink: "Prosecco", description: "The Classic party drink. Whether it’s New Years, a Wedding, or the old “I Hope 2020 Goes Well and Everything is Back To Normal in 2021” get together, this will bring strangers together in the best and worst of times!", imageName: "Prosecco", showingDetail: false)
        }
        .navigationBarTitle("Sparkling Wines")
    }
}

struct Sparkling_Wines_Previews: PreviewProvider {
    static var previews: some View {
        Sparkling_Wines()
    }
}
