import SwiftUI

struct StartView: View {
    
    let widthScreen = UIScreen.main.bounds.width
    let heightScreen = UIScreen.main.bounds.height
    
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
                }
                
            }
            
            
        }
        
    }
}
