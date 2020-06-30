//
//  Drink List.swift
//  Order a Drink
//
//  Created by Omar on 6/30/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct Drink_List: View {
    
    @State var showingNonAlco = false
    
    var body: some View {
        List {
            Button(action: {
                self.showingNonAlco.toggle()
            }) {
            HStack {
                Text("Non-Alcoholic Drinks")
                    .font(.title)
                Divider()
                Image("Drink1")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .trailing)
                }
            }
            .sheet(isPresented: $showingNonAlco) {
                Non_Alcoholic_Drinks()
            }
            
        }
    }
}

struct Drink_List_Previews: PreviewProvider {
    static var previews: some View {
        Drink_List()
    }
}
