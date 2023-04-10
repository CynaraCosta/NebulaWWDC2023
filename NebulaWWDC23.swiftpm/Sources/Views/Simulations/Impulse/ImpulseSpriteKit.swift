//
//import SpriteKit
//import SwiftUI
//
//
//class GameScene2: SKScene, SKPhysicsContactDelegate {
//
//    var object1: SKSpriteNode!
//    var hoopNode: SKSpriteNode!
//    var pointNode = SKShapeNode(rectOf: CGSize(width: 25, height: 1))
//
//
//    let ballCategory: UInt32 = 0x1 << 0
//    let hoopCategory: UInt32 = 0x1 << 1
//    let pointCategory: UInt32 = 0x1 << 2
//
//    var didCollide = false
//
//    var topBorder = SKShapeNode(rectOf: CGSize(width: 300, height: 20))
//    var leftBorder = SKShapeNode(rectOf: CGSize(width: 20, height: 300 ))
//    var rightBorder = SKShapeNode(rectOf: CGSize(width: 20, height: 300))
//
//    var startTouch = CGPoint()
//    var endTouch = CGPoint()
//
//    var touchedObject: SKSpriteNode?
//
//    let initialBallPosition = CGPoint(x: 100, y: 100)
//
//
//    override func didMove(to view: SKView) {
//
//        physicsWorld.gravity = CGVector(dx: 0, dy: Int(-9.8))
//        self.physicsWorld.contactDelegate = self
//
//
//        object1 = SKSpriteNode(imageNamed: "ball")
//        object1.name = "ball"
//        object1.physicsBody = SKPhysicsBody(circleOfRadius: 31)
//        object1.physicsBody?.affectedByGravity = true
//        object1.position = initialBallPosition
//        object1.physicsBody?.isDynamic = true
//        object1.physicsBody?.restitution = 0.5
//        object1.physicsBody?.categoryBitMask = ballCategory
//        object1.physicsBody?.contactTestBitMask = pointCategory
//        addChild(object1)
//
//
//        hoopNode = SKSpriteNode(imageNamed: "hoop")
//        hoopNode.name = "hoop"
//        hoopNode.position = CGPoint(x: 300, y: 300)
//        hoopNode.size = CGSize(width: 100, height: 100)
//        hoopNode.physicsBody = SKPhysicsBody(rectangleOf: hoopNode.size)
//        hoopNode.physicsBody?.affectedByGravity = false
//        hoopNode.physicsBody?.isDynamic = false
//        hoopNode.physicsBody?.categoryBitMask = hoopCategory
////        hoopNode.physicsBody?.contactTestBitMask = ballCategory
//        addChild(hoopNode)
//
//        pointNode.name = "point"
//        pointNode.strokeColor = .systemPink
//        pointNode.fillColor = .systemPink
//        pointNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 25, height: 1))
//        pointNode.physicsBody?.affectedByGravity = false
//        pointNode.physicsBody?.isDynamic = false
//        pointNode.position = .init(x: hoopNode.position.x, y: hoopNode.position.y + (hoopNode.size.height / 2))
//        pointNode.physicsBody?.categoryBitMask = pointCategory
//        addChild(pointNode)
//
//
//        let ground = SKSpriteNode(imageNamed: "ground-earth")
//        let groundWidth = 500
//        let groundHeight = 20
//
//        let size = CGSize(width: groundWidth, height: groundHeight)
//        ground.size = size
//
//        ground.position = CGPoint(x: 500 / 2, y: 10)
//
//        let groundPhysicsBody = SKPhysicsBody(rectangleOf: ground.size)
//        groundPhysicsBody.isDynamic = false
//        ground.physicsBody = groundPhysicsBody
//        addChild(ground)
//
//        topBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height: 10))
//        topBorder.physicsBody?.affectedByGravity = false
//        topBorder.physicsBody?.isDynamic = false
//        topBorder.fillColor = .white
//        topBorder.position = .init(x: frame.width / 2, y: frame.height)
//        addChild(topBorder)
//
//        leftBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: frame.height))
//        leftBorder.physicsBody?.affectedByGravity = false
//        leftBorder.physicsBody?.isDynamic = false
//        leftBorder.fillColor = .white
//        leftBorder.position = .init(x: 0, y: frame.height / 2)
//        addChild(leftBorder)
//
//        rightBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: frame.height))
//        rightBorder.physicsBody?.affectedByGravity = false
//        rightBorder.fillColor = .white
//        rightBorder.physicsBody?.isDynamic = false
//        rightBorder.position = .init(x: frame.width, y: frame.height / 2)
//        addChild(rightBorder)
//
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        for touch in touches {
//            let touchLocation = touch.location(in: self)
//            if object1.contains(touchLocation) {
//                touchedObject = object1
//            }
//
//            startTouch = touch.location(in: self)
//
//        }
//
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touchedObject = touchedObject else {
//            // a variável touchedObject é nula, sair da função
//            return
//        }
//
//        for touch in touches {
//            endTouch = touch.location(in: self)
//        }
//
//        touchedObject.physicsBody?.applyImpulse(CGVector(dx: endTouch.x - startTouch.x, dy: endTouch.y - startTouch.y))
//    }
//
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
//    override func update(_ currentTime: TimeInterval) {
//        if didCollide {
//            didCollide = false
//            object1.position = initialBallPosition
//        }
//
//    }
//
//
//    func didBegin(_ contact: SKPhysicsContact) {
//
//        if (contact.bodyA.node?.name == "ball" && contact.bodyB.node?.name == "point") {
//            didCollide = true
//        }
//
//        if (contact.bodyA.node?.name == "point" && contact.bodyB.node?.name == "ball") {
//            didCollide = true
//        }
//
//        }
//
//    func didEnd(_ contact: SKPhysicsContact) {
//
//    }
//
//}
//
//struct GameSceneView2: UIViewRepresentable {
//
//
//    func makeUIView(context: Context) -> SKView {
//
//        // Crie uma SKView para exibir a cena SpriteKit
//        let skView = SKView(frame: UIScreen.main.bounds)
//
//
//        // Crie a cena SpriteKit
//        let scene = GameScene2()
//        scene.size = CGSize(width: 500, height: 500)
//
//        scene.scaleMode = .aspectFill
//
//        scene.physicsWorld.gravity = CGVector(dx: 0, dy: Int(-9.8))
//
//        // Apresente a cena na SKView
//        skView.presentScene(scene)
//
//        return skView
//
//    }
//
//
//    func updateUIView(_ uiView: SKView, context: Context) {
//
//        // Nada a atualizar aqui
//
//    }
//
//}
//
//
