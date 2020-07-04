//
//  Non-Alcoholic Drinks.swift
//  Order a Drink
//
//  Created by Omar on 6/30/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

var globalDrink = "Drink Name"
var globalDescription = "Description"
var globalImageName = "PlaceholderImage"

struct Detail_Item: View {
    @State var showingDetail = false
    var drink: String
    var description: String
    var imageName: String
    
    init(drink: String, description: String, imageName: String, showingDetail: Bool) {
        self.drink = drink
        self.description = description
        self.imageName = imageName
    }
    
    var body: some View {
        Button(action: {
            self.showingDetail.toggle()
            globalDrink = self.drink
            globalDescription = self.description
            globalImageName = self.imageName
        }) {
            Text(self.drink)
        }
        .sheet(isPresented: $showingDetail) {
            ConfirmView(viewIsPresented: self.$showingDetail)
        }
    }
}


struct Non_Alcoholic_Drinks: View {
    
    var body: some View {
        List {
            Detail_Item(drink: "Sparkling Lemonade", description: "Lemonade that sparkles!", imageName: "SparklingLemonade", showingDetail: false)
            Detail_Item(drink: "Awesome Juice", description: "Juice again, really dumball...", imageName: "JuicyJ", showingDetail: false)
            /*
            Text("Sparkling Lemonade")
            Text("Classic Lemonade")
            Text("Limonagua")
            Text("Orange Juice")
            Text("Water")
            Text("Strawberry Spinach")
            Text("Gatorade")
            */
        }
        .navigationBarTitle("Non-Alcoholic Drinks")
    }
}

struct Non_Alcoholic_Drinks_Previews: PreviewProvider {
    static var previews: some View {
        Non_Alcoholic_Drinks()
    }
}
