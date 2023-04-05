import SwiftUI

struct OnboardingOne: View {
    
    let widthScreen = UIScreen.main.bounds.width
    let heightScreen = UIScreen.main.bounds.height
    
    var body: some View {
        
        ZStack {
            Background()
            
            VStack (spacing: 32) {
                
                Image.theme.plusButton
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.2, height: heightScreen * 0.14)
                
                Image.theme.planetJupiter
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.32, height: heightScreen * 0.23)
                
                Image.theme.planetEarth
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.26, height: heightScreen * 0.18)
                
                Image.theme.planetMercury
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.2, height: heightScreen * 0.14)
                
                Image.theme.rectText
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.88, height: heightScreen * 0.13)
                
            }
            
        }
    }
}
