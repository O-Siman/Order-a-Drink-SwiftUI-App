//
//  Non-Alcoholic Drinks.swift
//  Order a Drink
//
//  Created by Omar on 6/30/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct Non_Alcoholic_Drinks: View {
    
    var body: some View {
        List {
            Detail_Item(drink: "Sparkling Lemonade", description: "This fizzy-sweet lemonade is tasty enough to quench anyone’s thirst.", imageName: "SparklingLemonade", showingDetail: false)
            Detail_Item(drink: "Orange Juice", description: "Our freshly squeezed OJ makes the perfect breakfast drink, but you can drink it at any time!", imageName: "OrangeJuice", showingDetail: false)
            Detail_Item(drink: "Sparkling Orange Juice", description: "The perfect balance between Orange Juice and Sparkling Water!", imageName: "SparklingOrangeJuice", showingDetail: false)
            Detail_Item(drink: "Classic Lemonade", description: "Our amazing fresh lemonade! Enjoy!", imageName: "ClassicLemonade", showingDetail: false)
            Detail_Item(drink: "Limonagua", description: "Don’t get confused, because this isn’t lemonade or water. It’s not lemon water either. It’s lemonade diluted with water to tone down the acid!", imageName: "Limonagua", showingDetail: false)
            Detail_Item(drink: "Water", description: "I’m sure you know what this is, but I’ll give it a description anyway. It’s an essential part of you, so everyone in the room should highly respect you if you ordered this.", imageName: "Water", showingDetail: false)
            Detail_Item(drink: "Strawberry Spinach Smoothie", description: "The only smoothie you can order, but it’s a good one, trust me! You’d be surprised about how healthy this actually is; it’s good for you!", imageName: "StrawberrySpinachSmoothie", showingDetail: false)
            Detail_Item(drink: "Gatorade", description: "Energy in a bottle, I guess! In case you’ve been partying too hard, this is the way to go.", imageName: "Gatorade", showingDetail: false)
        }
        .navigationBarTitle("Non-Alcoholic Drinks")
    }
}

struct Non_Alcoholic_Drinks_Previews: PreviewProvider {
    static var previews: some View {
        Non_Alcoholic_Drinks()
    }
}
