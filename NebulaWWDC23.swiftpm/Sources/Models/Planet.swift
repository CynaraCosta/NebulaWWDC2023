import SwiftUI

struct Planet: Identifiable {
    
    let id: String
    let name: String
    let portraitImage: Image
    let model3d: String
    let gravityValue: Float
    let positionFromSun: String
    let groundImage: Image
    let backgroundImage: Image
    let disntaceFromSun: String
    let groundExtended: Image
    
    init(id: String = UUID().uuidString, name: String, portraitImage: Image, model3d: String, gravityValue: Float, positionFromSun: String, groundImage: Image, backgroundImage: Image, distanceFromSun: String, groundExtended: Image) {
        self.id = UUID().uuidString
        self.name = name
        self.portraitImage = portraitImage
        self.model3d = model3d
        self.gravityValue = gravityValue
        self.positionFromSun = positionFromSun
        self.groundImage = groundImage
        self.backgroundImage = backgroundImage
        self.disntaceFromSun = distanceFromSun
        self.groundExtended = groundExtended
    }
    
    
}
