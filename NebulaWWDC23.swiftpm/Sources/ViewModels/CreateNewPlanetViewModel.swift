import SwiftUI

class CreateNewPlanetViewModel: ObservableObject {
    
    @Published var namePlanet: String = ""
    @Published var gravityPlanet: String = ""
    @Published var currentIndex: Int = 0
    
    @Published var validateFields = true
    @Published var validateName = true
    
    @Published var images = ["sample-planet"]
    
    let allowedCharactersForName = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789._-&*ˆ%$#@!+=';"
    let allowedCharactersForGravityValue = "0123456789."
    
    func filterString(_ input: String, allowedCharacters: String) -> String {
        let filtered = input.filter { allowedCharacters.contains($0) }
        return filtered
    }
    
    func addCurrentIndexToGetNextImage() {
        currentIndex = (currentIndex + 1) % images.count
    }
    
    func removeCurrentIndexToGetPreviousImage() {
        currentIndex = (currentIndex - 1 + images.count) % images.count
    }
    
    func returnFromAddButton() -> Bool {
        
        if gravityPlanet == "" || namePlanet == "" {
            validateFields = false
        } else {
            validateFields = true
        }
        
        if namePlanet == "Earth" || namePlanet == "Jupiter" || namePlanet == "Mercury" {
            validateName = false
        } else {
            validateName = true
        }
        
        if validateName && validateFields {
            return true
        }
        
        return false
        
    }
    
    func treatFloat() -> Float {
        if let gravity = Float(gravityPlanet) {
                return gravity
            } else {
                return 10.0
            }
    }

}


