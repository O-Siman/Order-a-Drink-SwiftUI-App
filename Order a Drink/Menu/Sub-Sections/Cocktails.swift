//
//  Cocktails.swift
//  Order a Drink
//
//  Created by Omar on 7/1/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

//var globalDrink = "Drink Name"
//var globalDescription = "Description"
//var globalImageName = "PlaceholderImage"
//
//struct Detail_Item: View {
//    @State var showingDetail = false
//    var drink: String
//    var description: String
//    var imageName: String
//
//    init(drink: String, description: String, imageName: String, showingDetail: Bool) {
//        self.drink = drink
//        self.description = description
//        self.imageName = imageName
//    }
//
//    var body: some View {
//        Button(action: {
//            self.showingDetail.toggle()
//            globalDrink = self.drink
//            globalDescription = self.description
//            globalImageName = self.imageName
//        }) {
//            Text(self.drink)
//        }
//        .sheet(isPresented: $showingDetail) {
//            ConfirmView(viewIsPresented: self.$showingDetail)
//        }
//    }
//}

struct Cocktails: View {
    var body: some View {
        List {
            Detail_Item(drink: "Gin and Tonic", description: "The perfect mixture of Gin and Tonic Water to create our most popular cocktail.", imageName: "GinAndTonic", showingDetail: false)
            Detail_Item(drink: "Old Fashioned", description: "Ah, the Old Fashioned. A sugar cube, some Rye Whiskey, a few dashes of Angostura Bitters, and a maraschino cherry. It’s topped off with an orange peel to strike it home.", imageName: "OldFashioned", showingDetail: false)
            Detail_Item(drink: "Classic Margarita", description: "The signature Margarita that everyone loves.", imageName: "ClassicMargarita", showingDetail: false)
            Detail_Item(drink: "Frozen Margarita", description: "Just like the Classic Margarita, but frozen! A symphony of flavors, right at your fingertips.", imageName: "FrozenMargarita", showingDetail: false)
            Detail_Item(drink: "Rum and Coke", description: "This is for all those dads out there that like a hard Coke. Except with rum in it.", imageName: "RumAndCoke", showingDetail: false)
            Detail_Item(drink: "Cuba Libre", description: "Practically the same thing as a Rum and Coke, but with lime juice. Tough tasting, but elegantly decorated.", imageName: "CubaLibre", showingDetail: false)
        }
        .navigationBarTitle("Cocktails")
    }
}

struct Cocktails_Previews: PreviewProvider {
    static var previews: some View {
        Cocktails()
    }
}
