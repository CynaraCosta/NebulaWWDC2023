import SwiftUI
import SceneKit
import Combine

struct PlanetDetail: View {
    
    @State var namePlanet: String
    var planetsViewModel = Planets()
    @State var pressedSimulate = false
    @State private var isViewAppeared = false
    @State var terra: SCNScene? = .init(named: "earth3d.scn")
    
    var body: some View {
        
        var scenePlanet = planetsViewModel.returnScene(planet: planetsViewModel.whichPlanet(named: namePlanet)!)
        
        ZStack {
            
            Background()
            
            VStack (spacing: 0) {
                
                //                planetsViewModel.whichPlanet(named: namePlanet)?.portraitImage
                //                    .resizable()
                //                    .scaledToFit()
                //                    .background(.green)
                
                
                CustomSceneView(scene: scenePlanet)
                //0.52
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
