import SwiftUI

struct NewPlanetChooseSimulation: View {
    
    @State var namePlanet: String
    @State var isGravitySelected = false
    @State var isCollisionSelected = false
    @State private var isViewAppeared = false
    @State var isLaunchSelected = false
    
    @EnvironmentObject var planetsViewModel: Planets
    @EnvironmentObject var createNewPlanetViewModel: CreateNewPlanetViewModel
    
    var body: some View {
        
        var scenePlanet = planetsViewModel.returnScene(planet: planetsViewModel.planets[3])
        
        ZStack {
            
            Background()
            
            VStack (spacing: 32) {
                
                CustomSceneView(scene: scenePlanet)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.37, alignment: .center)
                    .onAppear {
                        self.isViewAppeared = true
                        //                        rotatePlanet()
                        planetsViewModel.rotatePlanet(planet: scenePlanet!)
                    }
                    .onDisappear {
                        self.isViewAppeared = false
                        //resetNodeState()
                        planetsViewModel.resetNodeState(planet: scenePlanet!)
                    }
                
                ZStack {
                    Image.theme.backgroundDetailPlanet
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.64)
                        
                    
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
                                    .font(.custom(.inconsolateRegular, size: 20))
                                    .foregroundColor(Color.theme.accentInitColor)
                                    .frame(width: UIScreen.getScreenWidth() * 0.3, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                            }
                            .padding(.bottom, UIScreen.getScreenWidth() * 0.02)
                            
                            NavigationLink(destination: PlanetSimulation(whichSimulation: "Gravity", whichPlanet: planetsViewModel.whichPlanet(named: namePlanet)!).environmentObject(planetsViewModel)
                                .environmentObject(createNewPlanetViewModel),
                                           isActive: $isGravitySelected,
                                           label: {
                                Button(action: {
                                    isGravitySelected.toggle()
                                }) {
                                    Image.theme.simulateButton
                                        .resizable()
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
                                    .font(.custom(.inconsolateRegular, size: 18))
                                    .foregroundColor(Color.theme.accentInitColor)
                                    .frame(width: UIScreen.getScreenWidth() * 0.3, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                            }
                            .padding(.bottom, UIScreen.getScreenWidth() * 0.02)
                            
                            NavigationLink(destination: PlanetSimulation(whichSimulation: "Collision", whichPlanet: planetsViewModel.whichPlanet(named: namePlanet)!).environmentObject(planetsViewModel)
                                .environmentObject(createNewPlanetViewModel),
                                           isActive: $isCollisionSelected,
                                           label: {
                                Button(action: {
                                    isCollisionSelected.toggle()
                                }) {
                                    Image.theme.simulateButton
                                        .resizable()
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
                                    .font(.custom(.inconsolateRegular, size: 18))
                                    .foregroundColor(Color.theme.accentInitColor)
                                    .frame(width: UIScreen.getScreenWidth() * 0.3, height: UIScreen.getScreenHeight() * 0.07, alignment: .leading)
                            }
                            .padding(.bottom, UIScreen.getScreenWidth() * 0.02)
                            
                            NavigationLink(destination: PlanetSimulation(whichSimulation: "Impulse", whichPlanet: planetsViewModel.whichPlanet(named: namePlanet)!).environmentObject(planetsViewModel)
                                .environmentObject(createNewPlanetViewModel),
                                           isActive: $isLaunchSelected,
                                           label: {
                                Button(action: {
                                    isLaunchSelected.toggle()
                                }) {
                                    Image.theme.simulateButton
                                        .resizable()
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

