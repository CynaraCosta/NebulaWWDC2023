//
//  SwiftUIView.swift
//  
//
//  Created by Cynara Costa on 06/04/23.
//

import SwiftUI

struct PlanetChooseSimulation: View {
    
    @State var namePlanet: String
    var planetsViewModel = Planets()
    @State var isGravitySelected = false
    @State var isCollisionSelected = false
    @State var isLaunchSelected = false
    
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
                        .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.65)
                    
                    VStack (spacing: 32) {
                        
                        Text(namePlanet)
                            .foregroundColor(Color.accentColor)
                            .font(.custom(.vt323, size: 96))
                            .frame(width: UIScreen.getScreenWidth() * 0.64, alignment: .leading)
                        
                        HStack (alignment: .center) {
                            
                            VStack (alignment: .center, spacing: -16){
                                
                                Text("Gravity")
                                    .font(.custom(.vt323, size: 48))
                                    .foregroundColor(Color.theme.accentInitColor)
                                    .frame(width: UIScreen.getScreenWidth() * 0.3, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                                
                                Text(planetsViewModel.getTextForGravity())
                                    .font(.custom(.inconsolateRegular, size: 24))
                                    .foregroundColor(Color.theme.accentInitColor)
                                    .frame(width: UIScreen.getScreenWidth() * 0.3, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                            }
                            .padding(.bottom, UIScreen.getScreenWidth() * 0.02)
                            
                            NavigationLink(destination: PlanetSimulation(whichSimulation: "Gravity", whichPlanet: planetsViewModel.whichPlanet(named: namePlanet)!),
                                           isActive: $isGravitySelected,
                                           label: {
                                Button(action: {
                                    isGravitySelected.toggle()
                                }) {
                                    Image.theme.simulateButton
                                        .frame(width: UIScreen.getScreenWidth() * 0.34, height: UIScreen.getScreenHeight() * 0.05)
                                }
                            })
                            
                        }
                        .frame(width: UIScreen.getScreenWidth() * 0.7, height: UIScreen.getScreenHeight() * 0.12)
                        
                        
                        HStack (alignment: .center) {
                            
                            VStack (alignment: .center, spacing: -16){
                                
                                Text("Collision")
                                    .font(.custom(.vt323, size: 48))
                                    .foregroundColor(Color.theme.accentInitColor)
                                    .frame(width: UIScreen.getScreenWidth() * 0.3, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                                
                                Text(planetsViewModel.getTextForCollision())
                                    .font(.custom(.inconsolateRegular, size: 24))
                                    .foregroundColor(Color.theme.accentInitColor)
                                    .frame(width: UIScreen.getScreenWidth() * 0.3, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                            }
                            .padding(.bottom, UIScreen.getScreenWidth() * 0.02)
                            
                            NavigationLink(destination: PlanetSimulation(whichSimulation: "Collision", whichPlanet: planetsViewModel.whichPlanet(named: namePlanet)!),
                                           isActive: $isCollisionSelected,
                                           label: {
                                Button(action: {
                                    isCollisionSelected.toggle()
                                }) {
                                    Image.theme.simulateButton
                                        .frame(width: UIScreen.getScreenWidth() * 0.34, height: UIScreen.getScreenHeight() * 0.05)
                                }
                            })
                            
                        }
                        .frame(width: UIScreen.getScreenWidth() * 0.7, height: UIScreen.getScreenHeight() * 0.12)
                        
                        HStack (alignment: .center) {
                            
                            VStack (alignment: .center, spacing: -16){
                                
                                Text("Impulse")
                                    .font(.custom(.vt323, size: 48))
                                    .foregroundColor(Color.theme.accentInitColor)
                                    .frame(width: UIScreen.getScreenWidth() * 0.3, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                                
                                Text(planetsViewModel.getTextForLaunch())
                                    .font(.custom(.inconsolateRegular, size: 24))
                                    .foregroundColor(Color.theme.accentInitColor)
                                    .frame(width: UIScreen.getScreenWidth() * 0.3, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                            }
                            .padding(.bottom, UIScreen.getScreenWidth() * 0.02)
                            
                            NavigationLink(destination: PlanetSimulation(whichSimulation: "Launch", whichPlanet: planetsViewModel.whichPlanet(named: namePlanet)!),
                                           isActive: $isLaunchSelected,
                                           label: {
                                Button(action: {
                                    isLaunchSelected.toggle()
                                }) {
                                    Image.theme.simulateButton
                                        .frame(width: UIScreen.getScreenWidth() * 0.34, height: UIScreen.getScreenHeight() * 0.05)
                                }
                            })
                            
                        }
                        .frame(width: UIScreen.getScreenWidth() * 0.7, height: UIScreen.getScreenHeight() * 0.12)
                        
                    }
                    
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct PlanetChooseSimulation_Previews: PreviewProvider {
    static var previews: some View {
        PlanetChooseSimulation(namePlanet: "Earth")
    }
}
