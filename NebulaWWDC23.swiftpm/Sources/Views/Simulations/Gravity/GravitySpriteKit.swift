import SpriteKit
import SwiftUI

class GameSceneGravity: SKScene {
    
    var ball: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        
        let backgroundImage = SKSpriteNode(imageNamed: "background-earth")
        backgroundImage.scale(to: size)
        backgroundImage.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(backgroundImage)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        
        ball = SKSpriteNode(imageNamed: "ball")
        ball.position = CGPoint(x: Int(size.width) / 2, y: 400)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2.0)
        ball.physicsBody?.affectedByGravity = true
        ball.physicsBody?.restitution = 0.5
        
        let ground = SKSpriteNode(imageNamed: "ground-earth")
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
            
            // Obtenha a localização do toque na cena
            let location = touch.location(in: self)
            
            // Verifique se o toque está dentro da bola
            if ball.contains(location) {
                
                // Desconecte a bola da gravidade para que possa ser arrastada
                ball.physicsBody?.affectedByGravity = false
                
            }
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            // Obtenha a localização do toque na cena
            let location = touch.location(in: self)
            
            // Movimente a bola para a localização do toque
            ball.position = location
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            // Obtenha a localização do toque na cena
            let location = touch.location(in: self)
            
            // Conecte a bola de volta à gravidade
            ball.physicsBody?.affectedByGravity = true
            
            // Defina a velocidade inicial da bola com base na distância do toque
            let dx = ball.position.x - location.x
            let dy = ball.position.y - location.y
            ball.physicsBody?.velocity = CGVector(dx: dx, dy: dy)
            
        }
        
    }

    
}
