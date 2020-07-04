//
//  TestView.swift
//  Order a Drink
//
//  Created by Omar on 7/3/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        List {
            HStack {
                VStack(alignment: .leading) {
                    Text("Sparkling Lemonade")
                        .fontWeight(.semibold)
                        .font(.headline)
                    Text("Juicy lemonade that sparkles!")
                        .font(.subheadline)
                    Divider()
                    Text("Ordered at 8:52 PM")
                        .font(.subheadline)
                }
                Spacer()
                Image("SparklingLemonade")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
