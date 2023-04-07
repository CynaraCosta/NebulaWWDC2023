import SwiftUI
import SpriteKit

struct GravityView: UIViewRepresentable {
    
    @State var whichPlanet: Planet
    var planetsViewModel = Planets()
    
    func makeUIView(context: Context) -> SKView {

        // Crie uma SKView para exibir a cena SpriteKit
        let skView = SKView(frame: UIScreen.main.bounds)
    

        // Crie a cena SpriteKit
        let scene = GameSceneGravity(backgroundImage: planetsViewModel.getBackgroundNameImage(planet: whichPlanet), ballImage: "ball", groundImage: planetsViewModel.getGroundNameImage(planet: whichPlanet), gravityValue: whichPlanet.gravityValue)
        
        scene.scaleMode = .aspectFill
        
        scene.physicsWorld.gravity = CGVector(dx: 0, dy: -3.7)

        // Apresente a cena na SKView
        skView.presentScene(scene)

        return skView

    }


    func updateUIView(_ uiView: SKView, context: Context) {

        // Nada a atualizar aqui

    }
    
}

//struct GravityView_Previews: PreviewProvider {
//    static var previews: some View {
//        GravityView(whichPlanet: Plan)
//            .frame(width: UIScreen.getScreenWidth() * 0.67, height: UIScreen.getScreenHeight() * 0.29)
//    }
//}
