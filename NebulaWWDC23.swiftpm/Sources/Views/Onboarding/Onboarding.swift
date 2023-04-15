import SwiftUI

struct Onboarding: View {
    
    let onboardingViewModel = OnboardingData()
    @State var counterOnboarding = 0
    @State var shouldGoHome = false
    @State var planetOpacity = false
    @State var plusOpacity = false
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var planetsViewModel: Planets
    @EnvironmentObject var createNewPlanetViewModel: CreateNewPlanetViewModel
    
    var body: some View {
        
        ZStack {
            Background()
            
            VStack (spacing: 32) {
                
                Image.theme.plusButton
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.getScreenWidth() * 0.2, height: UIScreen.getScreenHeight() * 0.14)
                    .opacity(plusOpacity ? 0.3 : 1.0)
                
                Image.theme.planetJupiter
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.getScreenWidth() * 0.32, height: UIScreen.getScreenHeight() * 0.23)
                    .opacity(planetOpacity ? 0.3 : 1.0)
                
                Image.theme.planetEarth
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.getScreenWidth() * 0.26, height: UIScreen.getScreenHeight() * 0.18)
                    .opacity(planetOpacity ? 0.3 : 1.0)
                
                Image.theme.planetMercury
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.getScreenWidth() * 0.2, height: UIScreen.getScreenHeight() * 0.14)
                    .opacity(planetOpacity ? 0.3 : 1.0)
                
                withAnimation {
                    OnboardingTextComponent(phrase: onboardingViewModel.phrases[counterOnboarding])
                }
                
                NavigationLink(destination:
                                HomeView()
                                .environmentObject(homeViewModel)
                                .environmentObject(planetsViewModel)
                                .environmentObject(createNewPlanetViewModel),
                               isActive: $shouldGoHome) {
                    EmptyView()
                }
                
                
            }.onTapGesture {
                
                if counterOnboarding < onboardingViewModel.phrases.count - 1 {
                    counterOnboarding += 1
                } else {
                    shouldGoHome.toggle()
                }
                
                
                if (counterOnboarding == 1) || (counterOnboarding == 2){
                    plusOpacity = true
                } else if counterOnboarding == 3 {
                    plusOpacity = false
                    planetOpacity = true
                } else {
                    plusOpacity = false
                    planetOpacity = false
                }
                
                
                
            }
        }
    }
}
