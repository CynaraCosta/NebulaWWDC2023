//
//  SwiftUIView.swift
//  
//
//  Created by Cynara Costa on 05/04/23.
//

import SwiftUI

struct PlanetDetail: View {
    
    @State var namePlanet: String
    var planetsViewModel = Planets()
    @State var pressedSimulate = false
    
    var body: some View {
        
        ZStack {
            
            Background()
            
            VStack (spacing: 32) {
                
                planetsViewModel.whichPlanet(named: namePlanet)?.portraitImage
                    .resizable()
                    .scaledToFit()
                
                ZStack {
                    Image.theme.backgroundDetailPlanet
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.64)
                    
                    VStack (spacing: 40) {
                        
                        Text(namePlanet)
                            .foregroundColor(Color.accentColor)
                            .font(.custom(.vt323, size: 96))
                            .frame(width: UIScreen.getScreenWidth() * 0.64, alignment: .leading)
                        
                        Text(planetsViewModel.getTextDistanceFromSun(name: namePlanet))
                            .foregroundColor(Color.accentColor)
                            .font(.custom(.inconsolateRegular, size: 24))
                            .frame(width: UIScreen.getScreenWidth() * 0.64, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                        
                        Text(planetsViewModel.getTextFromAgePlanet(name: namePlanet))
                            .foregroundColor(Color.accentColor)
                            .font(.custom(.inconsolateRegular, size: 24))
                            .frame(width: UIScreen.getScreenWidth() * 0.64, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                        
                        Text(planetsViewModel.getTextFromGravity(name: namePlanet))
                            .foregroundColor(Color.accentColor)
                            .font(.custom(.inconsolateRegular, size: 24))
                            .frame(width: UIScreen.getScreenWidth() * 0.64, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                        
                        HStack (spacing: 32) {
                            
                            Text("What about see how things work down on there?")
                                .foregroundColor(Color.accentColor)
                                .font(.custom(.vt323, size: 32))
                                .frame(width: UIScreen.getScreenWidth() * 0.27, alignment: .leading)
                                .fixedSize(horizontal: true, vertical: false)
                            
                            NavigationLink(destination: PlanetChooseSimulation(namePlanet: namePlanet), isActive: $pressedSimulate, label: {
                                Button(action: {
                                    pressedSimulate.toggle()
                                }) {
                                    Image.theme.simulateButton
                                        .resizable()
                                        .frame(width: UIScreen.getScreenWidth() * 0.34, height: UIScreen.getScreenHeight() * 0.05)
                                }
                            })
                        }
                        .frame(width: UIScreen.getScreenWidth() * 0.64, height: UIScreen.getScreenHeight() * 0.09)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }   
    }
}

struct PlanetDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDetail(namePlanet: "Earth")
    }
}
