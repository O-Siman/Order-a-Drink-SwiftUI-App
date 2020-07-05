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
                Text("Drink Name")
                    .fontWeight(.semibold)
                    .font(.headline)
                Text("Drink Desc")
                    .font(.subheadline)
                Spacer()
                Divider()
                Text("Ordered at time")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Transportation: train")
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            Spacer()
            Image("SparklingLemonade")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 100)
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
