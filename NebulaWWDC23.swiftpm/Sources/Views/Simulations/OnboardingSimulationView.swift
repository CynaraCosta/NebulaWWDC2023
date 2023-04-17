import SwiftUI

struct OnboardingSimulationView: View {
    
    @State var whichSimulation: String
    @State var whichPlanet: Planet
    @State var isButtonSelected = false
    @State private var isViewAppeared = false
    
    @EnvironmentObject var planetsViewModel: Planets
    @EnvironmentObject var createNewPlanetViewModel: CreateNewPlanetViewModel
    
    var body: some View {
        
        var scenePlanet = planetsViewModel.returnScene(planet: whichPlanet)
        
        ZStack {
            
            Background()
            
            VStack (spacing: 0) {
                
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
                        
                        
                        Text(planetsViewModel.whichPlanet(named: whichPlanet.name)!.name)
                            .foregroundColor(Color.accentColor)
                            .font(.custom(.vt323, size: 96))
                            .frame(width: UIScreen.getScreenWidth() * 0.64, height: UIScreen.getScreenHeight() * 0.09,alignment: .leading)
                        
                        Text(whichSimulation)
                            .foregroundColor(Color.accentColor)
                            .font(.custom(.vt323, size: 64))
                            .frame(width: UIScreen.getScreenWidth() * 0.64, height: UIScreen.getScreenHeight() * 0.04,alignment: .leading)
                        
                        
                        AnimatedGIFView(images: planetsViewModel.imagesForGif(planet: whichPlanet.name, simulation: whichSimulation)!, duration: 1.0)
                            .frame(width: UIScreen.getScreenWidth() * 0.67, height: UIScreen.getScreenHeight() * 0.3, alignment: .leading)
                        
                        NavigationLink(destination: PlanetSimulation(whichSimulation: whichSimulation, whichPlanet: planetsViewModel.whichPlanet(named: whichPlanet.name)!),
                                       isActive: $isButtonSelected,
                                       label: {
                            Button(action: {
                                isButtonSelected.toggle()
                            }) {
                                Image.theme.simulateButton
                                    .resizable()
                                    .frame(width: UIScreen.getScreenWidth() * 0.34, height: UIScreen.getScreenHeight() * 0.05)
                            }
                        })

                        
                    }
                    
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct OnboardingSimulationView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSimulationView(whichSimulation: "Gravity", whichPlanet: Planet(name: "Earth", portraitImage: Image.theme.planetEarth, model3d: "earth3d.scn", gravityValue: 9.8, positionFromSun: "third", groundImage: Image.theme.groundEarth, backgroundImage: Image.theme.backgroundEarth, distanceFromSun: "149.6", groundExtended: Image.theme.groundExtendedEarth))
    }
}
