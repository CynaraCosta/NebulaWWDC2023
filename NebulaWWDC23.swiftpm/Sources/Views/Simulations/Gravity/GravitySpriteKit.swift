import SpriteKit
import SwiftUI

class GameSceneGravity: SKScene {
    
    var ball: SKSpriteNode!
    
    let backgroundImage: String
    let ballImage: String
    let groundImage: String
    let gravityValue: Float
    
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
        
        ball = SKSpriteNode(imageNamed: ballImage)
        ball.position = CGPoint(x: Int(size.width) / 2, y: 400)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2.0)
        ball.physicsBody?.affectedByGravity = true
        ball.physicsBody?.restitution = 0.5
        
        let ground = SKSpriteNode(imageNamed: groundImage)
        let groundWidth = size.width * 1/3
        let groundHeight = ground.size.height * 1.5
        
        let size = CGSize(width: groundWidth, height: groundHeight)
        ground.size = size
        
        ground.position = CGPoint(x: UIScreen.getScreenWidth() * 0.67 / 2, y: 10)
        
        let groundPhysicsBody = SKPhysicsBody(rectangleOf: ground.size)
        groundPhysicsBody.isDynamic = false
        ground.physicsBody = groundPhysicsBody
        
        addChild(ball)
        addChild(ground)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if ball.contains(location) {
                
                ball.physicsBody?.affectedByGravity = false
                
            }
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {

            let location = touch.location(in: self)
            
            ball.position = location
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {

            let location = touch.location(in: self)
            
            ball.physicsBody?.affectedByGravity = true
            
            let dx = ball.position.x - location.x
            let dy = ball.position.y - location.y
            ball.physicsBody?.velocity = CGVector(dx: dx, dy: dy)
            
        }
        
    }
    
    
}
