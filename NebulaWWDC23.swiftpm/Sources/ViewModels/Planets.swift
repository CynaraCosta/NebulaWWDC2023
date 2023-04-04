import SwiftUI

class Planets: ObservableObject {
    
    var planets: [Planet]
    
    init() {
        self.planets = dataFromPlanets
    }
    
    func addPlanet(name: String, portraitImage: Image, gravityValue: Float, positionFromSun: String, groundImage: Image, backgroundImage: Image) {
        
        let newPlanet = Planet(name: name, portraitImage: portraitImage, gravityValue: gravityValue, positionFromSun: positionFromSun, groundImage: groundImage, backgroundImage: backgroundImage)
        
        planets.append(newPlanet)
        
    }
    
}

let dataFromPlanets = [
    Planet(name: "Jupiter", portraitImage: Image.theme.planetJupiter, gravityValue: -27.8, positionFromSun: "fifth", groundImage: Image.theme.groundEarth, backgroundImage: Image.theme.backgroundJupiter),
    Planet(name: "Earth", portraitImage: Image.theme.planetEarth, gravityValue: -9.8, positionFromSun: "third", groundImage: Image.theme.groundEarth, backgroundImage: Image.theme.backgroundEarth),
    Planet(name: "Mercury", portraitImage: Image.theme.planetMercury, gravityValue: -3.7, positionFromSun: "first", groundImage: Image.theme.groundEarth, backgroundImage: Image.theme.backgroundMercury)
]
