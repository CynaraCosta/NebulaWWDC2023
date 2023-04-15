import SwiftUI

struct StartView: View {
    
    @State var isAtMaxScale = false
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var planetsViewModel: Planets
    @EnvironmentObject var createNewPlanetViewModel: CreateNewPlanetViewModel
    
    private let animation = Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
    private let maxScale: CGFloat = 1.1
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Background()
                
                VStack (spacing: 88){
                    Image.theme.nebulaText
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.getScreenWidth() * 0.86, height: UIScreen.getScreenHeight() * 0.15)
                    
                    Text("AN INTERPLANETARY SIMULATION GAME")
                        .font(.custom(.vt323, size: 64))
                        .foregroundColor(Color.theme.lightGreen)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination:
                                    Onboarding()
                                        .environmentObject(homeViewModel)
                                        .environmentObject(planetsViewModel)
                                        .environmentObject(createNewPlanetViewModel)
                    ) {
                        Image.theme.pressStart
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.getScreenWidth() * 0.617, height: UIScreen.getScreenHeight() * 0.06)
                            .scaleEffect(isAtMaxScale ? maxScale : 1)
                            .onAppear {
                                withAnimation(self.animation) {
                                    self.isAtMaxScale.toggle()
                                }
                            }
                    }
                }
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
