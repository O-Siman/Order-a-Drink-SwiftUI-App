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
    var image = "Drink1"
    var sheetView = Non_Alcoholic_Drinks()
    var body: some View {
        Button(action: {
            self.showingDetail.toggle()
        }) {
            HStack {
            Text(name)
                .font(.title)
            Divider()
            Image(image)
                .resizable()
                .frame(width: 100, height: 100, alignment: .trailing)
            }
        }
        .sheet(isPresented: $showingDetail) {
            self.sheetView
        }
    }
}

struct Drink_List: View {
    
    var body: some View {
        List {
                List_Item(name: "Non-Alcoholic Drinks", image: "Drink1", sheetView: Non_Alcoholic_Drinks())
        }
    }
}

struct Drink_List_Previews: PreviewProvider {
    static var previews: some View {
        Drink_List()
    }
}
