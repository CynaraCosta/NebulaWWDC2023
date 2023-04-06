//
//  SwiftUIView.swift
//  
//
//  Created by Cynara Costa on 05/04/23.
//

import SwiftUI

struct PlanetDetail: View {
    
    @State var namePlanet: String
    
    var body: some View {
        Text("Este planeta é: \(namePlanet)")
    }
}

struct PlanetDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDetail(namePlanet: "Earth")
    }
}
