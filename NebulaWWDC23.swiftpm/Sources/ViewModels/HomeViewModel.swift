import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var addNewPlanet: Bool = false
    
    func alterAddNewPlanet() {
        addNewPlanet = true
    }
    
}
