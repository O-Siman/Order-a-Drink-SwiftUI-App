//
//  Drink List.swift
//  Order a Drink
//
//  Created by Omar on 6/30/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct List_Item: View {
    @State var showingDetail = false
    
    var name = "Loading..."
    var image = "PlaceholderImage"
    var sheetView: AnyView
    var body: some View {
        NavigationLink(destination: AnyView(sheetView)) {
            HStack {
                Image(image)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60, alignment: .trailing)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 3))
                    .shadow(radius: 3)
                Text(name)
                    .fontWeight(.bold)
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitle("Categories")
    }
}

struct Drink_List: View {
    
    var body: some View {
        NavigationView {
                List {
                    List_Item(name: "Non-Alcoholic Drinks", image: "NonAlco", sheetView: AnyView(Non_Alcoholic_Drinks()))
                    List_Item(name: "Red Wines", image: "RedWine", sheetView: AnyView(Red_Wines()))
                    List_Item(name: "White Wines", image: "WhiteWine", sheetView: AnyView(Red_Wines()))
                    List_Item(name: "Cocktails", image: "Cocktail", sheetView: AnyView(Red_Wines()))
                    List_Item(name: "Tequilas", image: "Tequila", sheetView: AnyView(Red_Wines()))
                    List_Item(name: "Sparkling Wines", image: "SparklingWine", sheetView: AnyView(Red_Wines()))
                }
        }
    }
}

struct Drink_List_Previews: PreviewProvider {
    static var previews: some View {
        Drink_List()
    }
}
