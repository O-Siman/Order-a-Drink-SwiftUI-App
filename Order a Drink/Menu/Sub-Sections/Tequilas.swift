//
//  Tequilas.swift
//  Order a Drink
//
//  Created by Omar on 7/1/20.
//  Copyright © 2020 Orange Inc. All rights reserved.
//

import SwiftUI

struct Tequilas: View {
    var body: some View {
        List {
            Detail_Item(drink: "Jose Cuervo Especial Tequila Reposado", description: "This “Especial” Tequila is “reposado,” meaning that it was aged in oak for a period of two months to twelve months!", imageName: "JoseCuervoEspecialTequilaReposado", showingDetail: false)
            Detail_Item(drink: "El Padrino Tequila Blanco", description: "This is a classic white tequila. It’s perfect for cocktails or shots!", imageName: "ElPadrinoTequilaBlanco", showingDetail: false)
        }
        .navigationBarTitle("Tequilas")
    }
}

struct Tequilas_Previews: PreviewProvider {
    static var previews: some View {
        Tequilas()
    }
}
