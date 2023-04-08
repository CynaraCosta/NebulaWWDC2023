import SwiftUI
import SpriteKit

struct CollisionView: UIViewRepresentable {
    
    @State var whichPlanet: Planet
    var planetsViewModel = Planets()
    
    func makeUIView(context: Context) -> SKView {

        // Crie uma SKView para exibir a cena SpriteKit
        let skView = SKView(frame: UIScreen.main.bounds)
    

        // Crie a cena SpriteKit
        let scene = GameSceneCollision(backgroundImage: planetsViewModel.getBackgroundNameImage(planet: whichPlanet), ballImage: "ball", groundImage: planetsViewModel.getGroundExtendedNameImage(planet: whichPlanet), gravityValue: whichPlanet.gravityValue)
        
        scene.scaleMode = .aspectFill
        
        scene.physicsWorld.gravity = CGVector(dx: 0, dy: Int(-whichPlanet.gravityValue))

        // Apresente a cena na SKView
        skView.presentScene(scene)

        return skView

    }


    func updateUIView(_ uiView: SKView, context: Context) {

        // Nada a atualizar aqui

    }
    
}

