import SwiftUI

class Planets: ObservableObject {
    
    var planets: [Planet]
    
    init() {
        self.planets = dataFromPlanets
    }
    
    func addPlanet(name: String, portraitImage: Image, gravityValue: Float, positionFromSun: String, groundImage: Image, backgroundImage: Image, distanceFromSun: String, groundExtended: Image) {
        
        let newPlanet = Planet(name: name, portraitImage: portraitImage, gravityValue: gravityValue, positionFromSun: positionFromSun, groundImage: groundImage, backgroundImage: backgroundImage, distanceFromSun: distanceFromSun, groundExtended: groundExtended)
        
        planets.append(newPlanet)
        
    }
    
    func whichPlanet(named name: String) -> Planet? {
            return planets.first(where: { $0.name == name })
        }
    
    func getTextDistanceFromSun(name: String) -> String {
        let planet = whichPlanet(named: name)
        guard let namePlanet = planet?.name else {return "placeholder"}
        guard let positionPlanetFromSun = planet?.positionFromSun else {return "placeholder"}
        guard let distancePlanetFromSun = planet?.disntaceFromSun else {return "placeholder"}
        let text = "\(namePlanet) is the \(positionPlanetFromSun) planet from the sun, with a distance of approximately \(distancePlanetFromSun) million kilometers."
        return text
    }
    
    func getTextFromAgePlanet(name: String) -> String {
        let planet = whichPlanet(named: name)
        guard let namePlanet = planet?.name else {return "placeholder"}
        let text = "The age of \(namePlanet) is estimated to be around 4.5 billion years, just like the age of the Solar System. "
        return text
    }
    
    func getTextFromGravity(name: String) -> String {
        let planet = whichPlanet(named: name)
        guard let namePlanet = planet?.name else {return "placeholder"}
        guard let gravityPlanet = planet?.gravityValue else {return "placeholder"}
        let text = "The acceleration due to gravity on the surface of \(namePlanet) is approximately \(gravityPlanet) meters per second squared (m/s²)."
        return text
    }
    
    func getTextForGravity() -> String {
        return textForGravity
    }
    
    func getTextForCollision() -> String {
        return textForCollision
    }
    
    func getTextForLaunch() -> String {
        return textForImpulse
    }
    
    func getBackgroundNameImage(planet: Planet) -> String {
        let nameBackgroundImage = "background-\(planet.name.lowercased())"
        return nameBackgroundImage
    }
    
    func getGroundNameImage(planet: Planet) -> String {
        let nameBackgroundImage = "ground-\(planet.name.lowercased())"
        return nameBackgroundImage
    }
    
    func getGroundExtendedNameImage(planet: Planet) -> String {
        let nameBackgroundImage = "ground-extended-\(planet.name.lowercased())"
        return nameBackgroundImage
    }
    
    func imagesForGif(planet: String, simulation: String) -> [UIImage]? {
        if let animation = animationsFrameForEachSimulationPlanet.first(where: { $0.planet == planet && $0.simulation == simulation }) {
            return animation.imagesForGif
        } else {
            return nil
        }
    }
    
}

let dataFromPlanets = [
    Planet(name: "Jupiter", portraitImage: Image.theme.planetJupiter, gravityValue: 27.8, positionFromSun: "fifth", groundImage: Image.theme.groundEarth, backgroundImage: Image.theme.backgroundJupiter, distanceFromSun: "778", groundExtended: Image.theme.groundEarth),
    Planet(name: "Earth", portraitImage: Image.theme.planetEarth, gravityValue: 9.8, positionFromSun: "third", groundImage: Image.theme.groundEarth, backgroundImage: Image.theme.backgroundEarth, distanceFromSun: "149.6", groundExtended: Image.theme.groundExtendedEarth),
    Planet(name: "Mercury", portraitImage: Image.theme.planetMercury, gravityValue: 3.7, positionFromSun: "first", groundImage: Image.theme.groundEarth, backgroundImage: Image.theme.backgroundMercury, distanceFromSun: "57.9", groundExtended: Image.theme.groundEarth)
]

let textForGravity = "Simulate gravity with an object inside this planet."
let textForCollision = "Simulate a collision with two objects inside this planet."
let textForImpulse = "simulate applying impulses to an object and see the physics involved"

struct AnimationDictType {
    var planet: String
    var simulation: String
    var imagesForGif: [UIImage]
}

let animationsFrameForEachSimulationPlanet: [AnimationDictType] = [
    
    AnimationDictType(planet: "Earth",simulation: "Gravity", imagesForGif: [
        UIImage(named: "frame-gravity-earth-1")!,
        UIImage(named: "frame-gravity-earth-2")!,
        UIImage(named: "frame-gravity-earth-3")!,
        UIImage(named: "frame-gravity-earth-4")!,
        UIImage(named: "frame-gravity-earth-5")!,
    ]),
    
    AnimationDictType(planet: "Earth", simulation: "Collision", imagesForGif: [
        UIImage(named: "frame-collision-earth-1")!,
        UIImage(named: "frame-collision-earth-2")!,
        UIImage(named: "frame-collision-earth-3")!,
        UIImage(named: "frame-collision-earth-4")!,
    ]),
    
    AnimationDictType(planet: "Earth", simulation: "Impulse", imagesForGif: [
        UIImage(named: "frame-collision-earth-1")!,
        UIImage(named: "frame-collision-earth-2")!,
        UIImage(named: "frame-collision-earth-3")!,
        UIImage(named: "frame-collision-earth-4")!,
    ]),
    
    AnimationDictType(planet: "Jupiter", simulation: "Gravity", imagesForGif: [
        UIImage(named: "frame-gravity-jupiter-1")!,
        UIImage(named: "frame-gravity-jupiter-2")!,
        UIImage(named: "frame-gravity-jupiter-3")!,
        UIImage(named: "frame-gravity-jupiter-4")!,
        UIImage(named: "frame-gravity-jupiter-5")!,

    ]),
    AnimationDictType(planet: "Jupiter", simulation: "Collision", imagesForGif: [
        UIImage(named: "frame-collision-jupiter-1")!,
        UIImage(named: "frame-collision-jupiter-2")!,
        UIImage(named: "frame-collision-jupiter-3")!,
        UIImage(named: "frame-collision-jupiter-4")!,
    ]),
    
    
    AnimationDictType(planet: "Jupiter", simulation: "Impulse", imagesForGif: [
        UIImage(named: "frame-collision-earth-1")!,
        UIImage(named: "frame-collision-earth-2")!,
        UIImage(named: "frame-collision-earth-3")!,
        UIImage(named: "frame-collision-earth-4")!,
    ]),
    
    AnimationDictType(planet: "Mercury", simulation: "Gravity", imagesForGif: [
        UIImage(named: "frame-gravity-mercury-1")!,
        UIImage(named: "frame-gravity-mercury-2")!,
        UIImage(named: "frame-gravity-mercury-3")!,
        UIImage(named: "frame-gravity-mercury-4")!,
        UIImage(named: "frame-gravity-mercury-5")!,

    ]),
    AnimationDictType(planet: "Mercury", simulation: "Collision", imagesForGif: [
        UIImage(named: "frame-collision-mercury-1")!,
        UIImage(named: "frame-collision-mercury-2")!,
        UIImage(named: "frame-collision-mercury-3")!,
        UIImage(named: "frame-collision-mercury-4")!,
    ]),
    
    AnimationDictType(planet: "Mercury", simulation: "Impulse", imagesForGif: [
        UIImage(named: "frame-collision-earth-1")!,
        UIImage(named: "frame-collision-earth-2")!,
        UIImage(named: "frame-collision-earth-3")!,
        UIImage(named: "frame-collision-earth-4")!,
    ]),
]
