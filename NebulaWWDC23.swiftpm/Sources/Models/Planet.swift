import SwiftUI

struct Planet: Identifiable {
    
    let id: String
    let name: String
    let portraitImage: Image
    let gravityValue: Float
    let positionFromSun: String
    let groundImage: Image
    let backgroundImage: Image
    let disntaceFromSun: String
    
    
    init(id: String = UUID().uuidString, name: String, portraitImage: Image, gravityValue: Float, positionFromSun: String, groundImage: Image, backgroundImage: Image, distanceFromSun: String) {
        self.id = UUID().uuidString
        self.name = name
        self.portraitImage = portraitImage
        self.gravityValue = gravityValue
        self.positionFromSun = positionFromSun
        self.groundImage = groundImage
        self.backgroundImage = backgroundImage
        self.disntaceFromSun = distanceFromSun
    }
    
    
}
