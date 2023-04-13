import SwiftUI

class TesteEnvironment: ObservableObject {
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var createNewPlanetViewModel = CreateNewPlanetViewModel()
    @StateObject var planetViewModel = Planets()
}
