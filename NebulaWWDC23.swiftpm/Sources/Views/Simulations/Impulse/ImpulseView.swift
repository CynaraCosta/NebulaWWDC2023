import SpriteKit
import SwiftUI

struct ImpulseView: UIViewRepresentable {
    
    @State var whichPlanet: Planet
    var planetsViewModel = Planets()
    
    func makeUIView(context: Context) -> SKView {

        let skView = SKView(frame: UIScreen.main.bounds)
    

        let scene = ImpulseSpriteKit(backgroundImage: planetsViewModel.getBackgroundNameImage(planet: whichPlanet), groundImage: planetsViewModel.getGroundExtendedNameImage(planet: whichPlanet), gravityValue: whichPlanet.gravityValue)
        
        scene.scaleMode = .aspectFill
        
        scene.physicsWorld.gravity = CGVector(dx: 0, dy: Int(-whichPlanet.gravityValue))
        
        skView.presentScene(scene)

        return skView

    }


    func updateUIView(_ uiView: SKView, context: Context) {


    }
    
}
