import SpriteKit
import SwiftUI


class ImpulseSpriteKit: SKScene, SKPhysicsContactDelegate {
    
    var ball: SKSpriteNode!
    var hoopNode: SKSpriteNode!
    var pointNode = SKShapeNode(rectOf: CGSize(width: 30, height: 1))
    
    let backgroundImage: String
    let groundImage: String
    let gravityValue: Float
    
    
    let ballCategory: UInt32 = 0x1 << 0
    let hoopCategory: UInt32 = 0x1 << 1
    let pointCategory: UInt32 = 0x1 << 2
    
    var didCollide = false
    
    var topBorder = SKShapeNode(rectOf: CGSize(width: UIScreen.main.bounds.width, height: 10))
    var leftBorder = SKShapeNode(rectOf: CGSize(width: 10, height: UIScreen.main.bounds.height))
    var rightBorder = SKShapeNode(rectOf: CGSize(width: 10, height: UIScreen.main.bounds.height))
    
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    
    var touchedObject: SKSpriteNode?
    
    let initialBallPosition = CGPoint(x: UIScreen.main.bounds.width * 0.4, y: 100)

    init(backgroundImage: String,  groundImage: String, gravityValue: Float) {
        self.backgroundImage = backgroundImage
        self.groundImage = groundImage
        self.gravityValue = gravityValue
        
        super.init(size: CGSize(width: UIScreen.getScreenWidth() * 0.67, height: UIScreen.getScreenHeight() * 0.355))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        let backgroundImage = SKSpriteNode(imageNamed: backgroundImage)
        backgroundImage.scale(to: size)
        backgroundImage.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(backgroundImage)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: Int(-gravityValue))

        let ground = SKSpriteNode(imageNamed: groundImage)
        let groundWidth = UIScreen.getScreenWidth() * 0.67
        let groundHeight = UIScreen.getScreenHeight() * 0.05
        
        let size = CGSize(width: groundWidth, height: groundHeight)
        ground.size = size
        
        ground.position = CGPoint(x: UIScreen.getScreenWidth() * 0.67 / 2, y: 10)
        
        let groundPhysicsBody = SKPhysicsBody(rectangleOf: ground.size)
        groundPhysicsBody.isDynamic = false
        ground.physicsBody = groundPhysicsBody
        addChild(ground)
        
        ball = SKSpriteNode(imageNamed: "ball")
        ball.name = "ball"
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 31)
        ball.physicsBody?.affectedByGravity = true
        ball.position = initialBallPosition
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.restitution = 0.5
        ball.physicsBody?.categoryBitMask = ballCategory
        ball.physicsBody?.contactTestBitMask = pointCategory
        addChild(ball)
        
        
        hoopNode = SKSpriteNode(imageNamed: "hoop")
        hoopNode.name = "hoop"
        hoopNode.size = CGSize(width: UIScreen.getScreenWidth() * 0.1, height: UIScreen.getScreenHeight() * 0.2)
        hoopNode.position = CGPoint(x: 100, y:  90 + groundHeight)
        hoopNode.physicsBody = SKPhysicsBody(rectangleOf: hoopNode.size)
        hoopNode.physicsBody?.affectedByGravity = false
        hoopNode.physicsBody?.isDynamic = false
        hoopNode.physicsBody?.categoryBitMask = hoopCategory
        addChild(hoopNode)

        pointNode.name = "point"
        pointNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: hoopNode.size.width * 0.6, height: 1))
        pointNode.physicsBody?.affectedByGravity = false
        pointNode.physicsBody?.isDynamic = false
        pointNode.position = .init(x: hoopNode.position.x, y: hoopNode.position.y + (hoopNode.size.height / 2))
        pointNode.physicsBody?.categoryBitMask = pointCategory
        addChild(pointNode)
        
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
            if ball.contains(touchLocation) {
                touchedObject = ball
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
        if didCollide {
            didCollide = false
            ball.position = initialBallPosition
        }

    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {

        if (contact.bodyA.node?.name == "ball" && contact.bodyB.node?.name == "point") {
            didCollide = true
        }
        
        if (contact.bodyA.node?.name == "point" && contact.bodyB.node?.name == "ball") {
            didCollide = true
        }
        
        }

    func didEnd(_ contact: SKPhysicsContact) {
        
    }
    
}





