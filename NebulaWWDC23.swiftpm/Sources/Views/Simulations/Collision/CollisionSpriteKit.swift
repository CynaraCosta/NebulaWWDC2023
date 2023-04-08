import SwiftUI
import SpriteKit

class GameSceneCollision: SKScene {
    
    var object1: SKSpriteNode!
    var object2: SKSpriteNode!
    
    let backgroundImage: String
    let ballImage: String
    let groundImage: String
    let gravityValue: Float
    
    var topBorder = SKShapeNode(rectOf: CGSize(width: UIScreen.getScreenWidth() * 0.67, height: 20))
    var leftBorder = SKShapeNode(rectOf: CGSize(width: 20, height: UIScreen.getScreenHeight() * 0.355))
    var rightBorder = SKShapeNode(rectOf: CGSize(width: 20, height: UIScreen.getScreenHeight() * 0.355))
    
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    
    var touchedObject: SKSpriteNode?
    
    init(backgroundImage: String, ballImage: String, groundImage: String, gravityValue: Float) {
        self.backgroundImage = backgroundImage
        self.ballImage = ballImage
        self.groundImage = groundImage
        self.gravityValue = gravityValue
        
        super.init(size: CGSize(width: UIScreen.getScreenWidth() * 0.67, height: UIScreen.getScreenHeight() * 0.355))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        let backgroundImage = SKSpriteNode(imageNamed: backgroundImage)
        backgroundImage.scale(to: size)
        backgroundImage.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(backgroundImage)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: Int(-gravityValue))
        
        object1 = SKSpriteNode(imageNamed: ballImage)
        object1.physicsBody = SKPhysicsBody(circleOfRadius: 31)
        object1.physicsBody?.affectedByGravity = true
        object1.position = .init(x: UIScreen.getScreenWidth() / 2, y: UIScreen.getScreenHeight() * 0.04 + 20)
        object1.physicsBody?.isDynamic = true
        object1.physicsBody?.restitution = 0.5
        addChild(object1)
        
        object2 = SKSpriteNode(imageNamed: ballImage)
        object2.physicsBody = SKPhysicsBody(circleOfRadius: 31)
        object2.physicsBody?.affectedByGravity = true
        object2.position = .init(x: UIScreen.getScreenWidth() / 4.5, y: UIScreen.getScreenHeight() * 0.04 + 20)
        object2.physicsBody?.isDynamic = true
        object2.physicsBody?.restitution = 0.5
        addChild(object2)
        
        let ground = SKSpriteNode(imageNamed: groundImage)
        let groundWidth = UIScreen.getScreenWidth() * 0.67
        let groundHeight = UIScreen.getScreenHeight() * 0.04
        
        let size = CGSize(width: groundWidth, height: groundHeight)
        ground.size = size
        
        ground.position = CGPoint(x: UIScreen.getScreenWidth() * 0.67 / 2, y: 10)
        
        let groundPhysicsBody = SKPhysicsBody(rectangleOf: ground.size)
        groundPhysicsBody.isDynamic = false
        ground.physicsBody = groundPhysicsBody
        addChild(ground)
        
        topBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height: 10))
        topBorder.physicsBody?.affectedByGravity = false
        topBorder.physicsBody?.isDynamic = false
        topBorder.fillColor = .white
        topBorder.position = .init(x: frame.width / 2, y: frame.height)
        addChild(topBorder)
        
        leftBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: frame.height))
        leftBorder.physicsBody?.affectedByGravity = false
        leftBorder.physicsBody?.isDynamic = false
        leftBorder.fillColor = .white
        leftBorder.position = .init(x: 0, y: frame.height / 2)
        addChild(leftBorder)
        
        rightBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: frame.height))
        rightBorder.physicsBody?.affectedByGravity = false
        rightBorder.fillColor = .white
        rightBorder.physicsBody?.isDynamic = false
        rightBorder.position = .init(x: frame.width, y: frame.height / 2)
        addChild(rightBorder)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if object1.contains(touchLocation) {
                touchedObject = object1
                
            } else if object2.contains(touchLocation) {
                touchedObject = object2
            }
            
            startTouch = touch.location(in: self)
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchedObject = touchedObject else {
            // a variável touchedObject é nula, sair da função
            return
        }

        for touch in touches {
            endTouch = touch.location(in: self)
        }
        
        touchedObject.physicsBody?.applyImpulse(CGVector(dx: endTouch.x - startTouch.x, dy: endTouch.y - startTouch.y))
    }

    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}

struct PlanetSimulationCollision_Previews: PreviewProvider {
    static var previews: some View {
        PlanetSimulation(whichSimulation: "Collision", whichPlanet: Planet(name: "Earth", portraitImage: Image.theme.planetEarth, gravityValue: 9.8, positionFromSun: "third", groundImage: Image.theme.groundEarth, backgroundImage: Image.theme.backgroundEarth, distanceFromSun: "149.6", groundExtended: Image.theme.groundExtendedEarth))
    }
}
