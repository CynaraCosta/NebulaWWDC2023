import SwiftUI

struct PlanetSimulation: View {
    
    @State var whichSimulation: String
    @State var whichPlanet: Planet
    
    @EnvironmentObject var planetsViewModel: Planets
    @EnvironmentObject var createNewPlanetViewModel: CreateNewPlanetViewModel
    
    @State private var isViewAppeared = false
    
    var body: some View {
        
        var scenePlanet = planetsViewModel.returnScene(planet: whichPlanet)
        
        ZStack {
            
            Background()
            
            VStack (spacing: 0) {
                
                CustomSceneView(scene: scenePlanet)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.37, alignment: .center)
                    .onAppear {
                        self.isViewAppeared = true
                        planetsViewModel.rotatePlanet(planet: scenePlanet!)
                    }
                    .onDisappear {
                        self.isViewAppeared = false
                        planetsViewModel.resetNodeState(planet: scenePlanet!)
                    }
                
                ZStack {
                    Image.theme.backgroundDetailPlanet
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.64)
                    
                    VStack (spacing: 16) {
                        
                        Text(planetsViewModel.whichPlanet(named: whichPlanet.name)!.name)
                            .foregroundColor(Color.accentColor)
                            .font(.custom(.vt323, size: 96))
                            .frame(width: UIScreen.getScreenWidth() * 0.64, alignment: .leading)
                        
                        HStack () {
                            
                            Text(whichSimulation)
                                .foregroundColor(.accentColor)
                                .font(.custom(.vt323, size: 54))
                                .frame(width: UIScreen.getScreenWidth() * 0.24, height: UIScreen.getScreenHeight() * 0.04, alignment: .leading)
                            
                            Spacer()
                            
                            if whichSimulation == "Gravity" {
                                Text("Gravity: \(String(format: "%.1f", whichPlanet.gravityValue)) m/s²")
                                    .foregroundColor(.accentColor)
                                    .font(.custom(.inconsolateRegular, size: 32))
                                    .frame(width: UIScreen.getScreenWidth() * 0.37, height: UIScreen.getScreenHeight() * 0.04, alignment: .trailing)
                            }
                            
                            
                        }
                        .frame(width: UIScreen.getScreenWidth() * 0.64, height: UIScreen.getScreenHeight() * 0.04)
                        
                        
                        if whichSimulation == "Gravity" {
                            
                            GravityView(whichPlanet: whichPlanet)
                                .environmentObject(planetsViewModel)
                                .environmentObject(createNewPlanetViewModel)
                                .frame(width: UIScreen.getScreenWidth() * 0.67, height: UIScreen.getScreenHeight() * 0.355)
                            
                        } else if whichSimulation == "Collision" {
                            CollisionView(whichPlanet: whichPlanet)
                                .environmentObject(planetsViewModel)
                                .environmentObject(createNewPlanetViewModel)
                                .frame(width: UIScreen.getScreenWidth() * 0.67, height: UIScreen.getScreenHeight() * 0.355)
                        } else if whichSimulation == "Impulse" {
                            ImpulseView(whichPlanet: whichPlanet)
                                .environmentObject(planetsViewModel)
                                .environmentObject(createNewPlanetViewModel)
                                .frame(width: UIScreen.getScreenWidth() * 0.67, height: UIScreen.getScreenHeight() * 0.355)
                        }
                        
                        Text("This simulation does not consider other factor like: density, atmosphere and some others!")
                            .foregroundColor(Color.accentColor)
                            .font(.custom(.inconsolateRegular, size: 20))
                            .frame(width: UIScreen.getScreenWidth() * 0.67, height: UIScreen.getScreenHeight() * 0.04, alignment: .leading)
                        
                    }
                    
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        
    }
}

struct PlanetSimulation_Previews: PreviewProvider {
    static var previews: some View {
        PlanetSimulation(whichSimulation: "Collision", whichPlanet: Planet(name: "Earth", portraitImage: Image.theme.planetEarth, model3d: "earth3d.scn", gravityValue: 9.8, positionFromSun: "third", groundImage: Image.theme.groundEarth, backgroundImage: Image.theme.backgroundEarth, distanceFromSun: "149.6", groundExtended: Image.theme.groundExtendedEarth))
    }
}
