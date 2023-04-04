import SwiftUI

struct StartView: View {
    
    @State var isAtMaxScale = false
    
    let widthScreen = UIScreen.main.bounds.width
    let heightScreen = UIScreen.main.bounds.height
    
    private let animation = Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
    private let maxScale: CGFloat = 1.1
    
    var body: some View {
        ZStack {
            
            Image.theme.background
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack (spacing: 88){
                Image.theme.nebulaText
                    .resizable()
                    .scaledToFit()
                    .frame(width: widthScreen * 0.86, height: heightScreen * 0.15)
                
                Text("AN INTERPLANETARY SIMULATION GAME")
                    .font(.custom(.vt323, size: 64))
                    .foregroundColor(Color.theme.lightGreen)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    print("button pressed")
                }) {
                    Image.theme.pressStart
                        .resizable()
                        .scaledToFit()
                        .frame(width: widthScreen * 0.617, height: heightScreen * 0.06)
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
}
