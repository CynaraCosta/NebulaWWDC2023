import SwiftUI
import SpriteKit

struct AnimatedGIFView: UIViewRepresentable {
    
    let images: [UIImage]
    let duration: TimeInterval
    
    func makeUIView(context: Context) -> UIImageView {
        return UIImageView()
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        uiView.image = UIImage.animatedImage(with: images, duration: duration)
    }
}

