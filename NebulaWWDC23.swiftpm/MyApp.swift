import SwiftUI

@main
struct MyApp: App {
    
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var planetViewModel = Planets()
    
    init() {
        CustomFonts.register()
    }
    
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(homeViewModel)
                .environmentObject(planetViewModel)
        }
    }
}
