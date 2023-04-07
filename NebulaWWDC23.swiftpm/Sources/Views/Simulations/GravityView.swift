import SwiftUI
import SpriteKit

struct GravityView: UIViewRepresentable {
    
    @State var whichPlanet: Planet
    var planetsViewModel = Planets()
    var ballInitPosition = 400
    var shouldUpdate = false
    
    func makeUIView(context: Context) -> SKView {
        let scene = SKScene(size: CGSize(width: UIScreen.getScreenWidth() * 0.67, height: UIScreen.getScreenHeight() * 0.29))
        
        let backgroundImage = SKSpriteNode(imageNamed: planetsViewModel.getBackgroundNameImage(planet: whichPlanet))
        backgroundImage.scale(to: scene.size)
        backgroundImage.position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        scene.addChild(backgroundImage)
        
        scene.physicsWorld.gravity = CGVector(dx: 0, dy: Int(-whichPlanet.gravityValue))
        
        let ball = SKSpriteNode(imageNamed: "ball")
        ball.position = CGPoint(x: Int(scene.size.width) / 2, y: ballInitPosition)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2.0)
        ball.physicsBody?.affectedByGravity = true
        ball.physicsBody?.restitution = 0.5
        
        let ground = SKSpriteNode(imageNamed: planetsViewModel.getGroundNameImage(planet: whichPlanet))
        let groundWidth = scene.size.width * 1/3
        let groundHeight = ground.size.height * 1.5
        
        let size = CGSize(width: groundWidth, height: groundHeight)
        ground.size = size
        
        ground.position = CGPoint(x: scene.size.width / 2, y: 10)
        
        let groundPhysicsBody = SKPhysicsBody(rectangleOf: ground.size)
        groundPhysicsBody.isDynamic = false
        ground.physicsBody = groundPhysicsBody
        
        scene.addChild(ball)
        scene.addChild(ground)
        
        let view = SKView(frame: .zero)
        view.presentScene(scene)
        return view
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
        if shouldUpdate {
            let scene = uiView.scene ?? SKScene()
            
            for node in scene.children where node != scene.children.first(where: { $0.name == "backgroundImage" }) && node != scene.children.first(where: { $0.name == "ground" }) {
                node.removeFromParent()
            }
            
            
            let ball = SKSpriteNode(imageNamed: "ball")
            ball.physicsBody?.velocity = .zero
            ball.physicsBody?.angularVelocity = 0
            ball.position = CGPoint(x: Int(scene.size.width) / 2, y: ballInitPosition)
            
            
            scene.addChild(ball)
        }
        
    }
    
}
