import SwiftUI
import SpriteKit

struct GravityView: UIViewRepresentable {
    
    @State var whichPlanet: Planet
    
    @EnvironmentObject var planetsViewModel: Planets
    @EnvironmentObject var createNewPlanetViewModel: CreateNewPlanetViewModel
    
    func makeUIView(context: Context) -> SKView {
        var isNameDifferent = false
        
        if whichPlanet.name == "Earth" || whichPlanet.name == "Jupiter" || whichPlanet.name == "Mercury" {
            isNameDifferent = false
        } else {
            isNameDifferent = true
        }
        
        let skView = SKView(frame: UIScreen.main.bounds)
        
        let scene = GameSceneGravity(
            backgroundImage: isNameDifferent ? createNewPlanetViewModel.getBackgroundImageName()  : planetsViewModel.getBackgroundNameImage(planet: whichPlanet),
            ballImage: "ball",
            groundImage: isNameDifferent ? createNewPlanetViewModel.getGroundImageName() : planetsViewModel.getGroundNameImage(planet: whichPlanet),
            gravityValue: whichPlanet.gravityValue
        )
        
        scene.scaleMode = .aspectFill
        
        scene.physicsWorld.gravity = CGVector(dx: 0, dy: Int(-whichPlanet.gravityValue))

        skView.presentScene(scene)

        return skView

    }

    func updateUIView(_ uiView: SKView, context: Context) {

    }
    
}
