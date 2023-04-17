import SwiftUI
import SceneKit
import Combine

struct PlanetDetail: View {
    
    @State var namePlanet: String
    var planetsViewModel = Planets()
    @State var pressedSimulate = false
    @State private var isViewAppeared = false
    @State var terra: SCNScene? = .init(named: "earth3dteste.scn")
    
    var body: some View {
        
        ZStack {
            
            Background()
            
            VStack (spacing: 0) {
                
                //                planetsViewModel.whichPlanet(named: namePlanet)?.portraitImage
                //                    .resizable()
                //                    .scaledToFit()
                //                    .background(.green)
                
                
                CustomSceneView(scene: $terra)
                //0.52
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.37, alignment: .center)
                    .onAppear {
                        self.isViewAppeared = true
                        rotatePlanet()
                    }
                    .onDisappear {
                        self.isViewAppeared = false
                        resetNodeState()
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
    
    func resetNodeState() {
        terra?.rootNode.removeAllActions()
        
        terra?.rootNode.position = SCNVector3(x: 0.9, y: 0.8, z: -1.5)
        terra?.rootNode.scale = SCNVector3(x: 1.0, y: 1.0, z: 1.0)
        terra?.rootNode.rotation = SCNVector4(x: 0.0, y: 0.0, z: 0.0, w: 0.0)
    }

    func rotatePlanet() {
        resetNodeState()
        
        let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(-2 * Double.pi), z: 0, duration: 10)
        let repeatRotation = SCNAction.repeatForever(rotation)
        terra?.rootNode.runAction(repeatRotation)
    }
    

    
}

struct PlanetDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDetail(namePlanet: "Earth")
    }
}
