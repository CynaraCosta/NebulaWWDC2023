import SwiftUI

struct Onboarding: View {
    
    let widthScreen = UIScreen.main.bounds.width
    let heightScreen = UIScreen.main.bounds.height
    let onboardingViewModel = OnboardingData()
    @State var counterOnboarding = 0
    @State var shouldShowText = true
    @State var planetOpacity = false
    @State var plusOpacity = false
    
    var body: some View {
        
        ZStack {
            Background()
            
            VStack (spacing: 32) {
                
                Image.theme.plusButton
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.2, height: heightScreen * 0.14)
                    .opacity(plusOpacity ? 0.3 : 1.0)
                
                Image.theme.planetJupiter
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.32, height: heightScreen * 0.23)
                    .opacity(planetOpacity ? 0.3 : 1.0)
                
                Image.theme.planetEarth
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.26, height: heightScreen * 0.18)
                    .opacity(planetOpacity ? 0.3 : 1.0)
                
                Image.theme.planetMercury
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.2, height: heightScreen * 0.14)
                    .opacity(planetOpacity ? 0.3 : 1.0)
                
                if shouldShowText {
                    withAnimation {
                        OnboardingTextComponent(phrase: onboardingViewModel.phrases[counterOnboarding])
                    }
                }
                
                
                
            }.onTapGesture {
                
                if counterOnboarding < onboardingViewModel.phrases.count - 1 {
                    counterOnboarding += 1
                } else {
                    shouldShowText = false
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
