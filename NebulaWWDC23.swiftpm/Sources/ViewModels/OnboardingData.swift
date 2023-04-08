import SwiftUI

class OnboardingData {
    
    var phrases: [String] = []
    
    init() {
        self.phrases = phrasesOnboarding
    }
    
}

let phrasesOnboarding = [
    "Welcome to this interplanetary experience! We are excited to have you on board on this journey across the universe. Here is some information to help you get started",
    "In this experiment we offer you the opportunity to explore information about some planets in our solar system and simulate some physics related to them, such as gravity, collision and impulse.",
    "That is, you can experience the feeling of being on another planet and have a unique and fun experience.",
    "In addition, you can create your own planet and customize your information. You will have the opportunity to experiment and create unique planets that have never existed before!",
    "I hope you have an amazing experience and a good interplanetary trip!"
]
