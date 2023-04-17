import SwiftUI
import SceneKit

struct CustomSceneView: UIViewRepresentable {
    var scene: SCNScene?
    
    func makeUIView(context: Context) ->  SCNView {
        let view = SCNView()
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.scene = scene
        
        scene?.rootNode.pivot = SCNMatrix4MakeTranslation(0.85, 0.85, -0.85)
//        scene?.rootNode.position = SCNVector3(0.9, 0.8, -1.5)

        
        view.backgroundColor = .clear
        
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {

    }
    
    
    
}

