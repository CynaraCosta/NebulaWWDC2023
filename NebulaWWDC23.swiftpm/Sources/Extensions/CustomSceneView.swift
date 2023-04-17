import SwiftUI
import SceneKit

struct CustomSceneView: UIViewRepresentable {
    @Binding var scene: SCNScene?
    
    func makeUIView(context: Context) ->  SCNView {
        let view = SCNView()
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.scene = scene
        
        scene?.rootNode.pivot = SCNMatrix4MakeTranslation(0.85, 0.85, -0.85)
        scene?.rootNode.position = SCNVector3(0.9, 0.8, -1.5)
        
        let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(-2 * Double.pi), z: 0, duration: 10)
        let repeatRotation = SCNAction.repeatForever(rotation)
        scene?.rootNode.runAction(repeatRotation)
        
        view.backgroundColor = .clear
        
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {

    }
    
    
    
}

