import SwiftUI

class CreateNewPlanetViewModel: ObservableObject {
    
    @Published var namePlanet: String = ""
    @Published var gravityPlanet: String = ""
    @Published var currentIndex: Int = 0
    
    @Published var validateFields = true
    @Published var validateName = true
    @Published var backToHome = false
    
    @Published var isBlue = false
    @Published var isRed = false
    @Published var isGreen = false
    
    @Published var imagesPlanet: [String] = [
        "sample-planet-blue",
        "sample-planet-red",
        "sample-planet-green"
    ]
    
    let allowedCharactersForName = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789._-&*ˆ%$#@!+=';"
    let allowedCharactersForGravityValue = "0123456789."
    
    func filterString(_ input: String, allowedCharacters: String) -> String {
        let filtered = input.filter { allowedCharacters.contains($0) }
        return filtered
    }
    
    func addCurrentIndexToGetNextImage() {
        currentIndex = (currentIndex + 1) % imagesPlanet.count
    }
    
    func removeCurrentIndexToGetPreviousImage() {
        currentIndex = (currentIndex - 1 + imagesPlanet.count) % imagesPlanet.count
    }
    
    func whichColorPlanet() {
        if currentIndex == 0 {
            isBlue = true
        } else if currentIndex == 1 {
            isRed = true
        } else if currentIndex == 2 {
            isGreen = true
        }
    }
    
    func getPortraitImage() -> Image {
        if isBlue {
            return Image.theme.samplePlanetBlue
        } else if isRed {
            return Image.theme.samplePlanetRed
        } else {
            return Image.theme.samplePlanetGreen
        }
    }
    
    func getBackgroundImage() -> Image {
        if isBlue {
            return Image.theme.backgroundSamplePlanetBlue
        } else if isRed {
            return Image.theme.backgroundSamplePlanetRed
        } else {
            return Image.theme.backgroundSamplePlanetGreen
        }
    }
    
    func getGroundImage() -> Image {
        if isBlue {
            return Image.theme.groundSamplePlanetBlue
        } else if isRed {
            return Image.theme.groundSamplePlanetRed
        } else {
            return Image.theme.groundSamplePlanetGreen
        }
    }
    
    func getExtendedGroundImage() -> Image {
        if isBlue {
            return Image.theme.groundExtendedSamplePlanetBlue
        } else if isRed {
            return Image.theme.groundExtendedSamplePlanetRed
        } else {
            return Image.theme.groundExtendedSamplePlanetGreen
        }
    }
    
    func getBackgroundImageName() -> String {
        if isBlue {
            return "background-sample-planet-blue"
        } else if isRed {
            return "background-sample-planet-red"
        } else {
            return "background-sample-planet-green"
        }
    }
    
    func getGroundImageName() -> String {
        if isBlue {
            return "ground-sample-planet-blue"
        } else if isRed {
            return "ground-sample-planet-red"
        } else {
            return "ground-sample-planet-green"
        }
    }
    
    func getExtendedGroundImageName() -> String {
        if isBlue {
            return "ground-extended-sample-planet-blue"
        } else if isRed {
            return "ground-extended-sample-planet-red"
        } else {
            return "ground-extended-sample-planet-green"
        }
    }
    
    func get3dName() -> String {
        if isBlue {
            return "sample-planet-blue.scn"
        } else if isRed {
            return "sample-planet-red.scn"
        } else {
            return "sample-planet-green.scn"
        }
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


