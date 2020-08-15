//
//  White Wines.swift
//  Order a Drink
//
//  Created by Omar on 7/1/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct White_Wines: View {
    var body: some View {
        List {
            Detail_Item(drink: "Butler Hill Pinot Gris", description: "A classic white wine with the authentic taste of Willamette Valley, Oregon.", imageName: "ButlerHillPinotGris", showingDetail: false)
            Detail_Item(drink: "The Jumper Marlborough Sauvignon", description: "This white wine is approachable, balanced, and made with love in the Wairau Valley of Marlborough, New Zealand.", imageName: "TheJumperMarlboroughSauvignon", showingDetail: false)
            Detail_Item(drink: "Mario Ercolino Saserello", description: "This Saserello has characteristic notes of lemon blossom, combined with mature yellow fruit aromas. Peach and apple flavors are balanced by the wine’s freshness and minerality, to reveal the perfect seafood white.", imageName: "MarioErcolinoSaserello", showingDetail: false)
        }
        .navigationBarTitle("White Wines")
    }
}

struct White_Wines_Previews: PreviewProvider {
    static var previews: some View {
        White_Wines()
    }
}
