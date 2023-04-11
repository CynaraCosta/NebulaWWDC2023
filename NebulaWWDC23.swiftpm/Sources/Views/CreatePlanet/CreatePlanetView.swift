import SwiftUI

struct CreatePlanetView: View {
    @State private var namePlanet: String = ""
    @State private var gravityPlanet: String = ""
    @State private var currentIndex: Int = 0
//    let images = ["frame-gravity-earth-1", "frame-gravity-earth-2", "frame-gravity-earth-3"]
    let images = ["sample-planet"]
    
    var body: some View {
        ZStack {
            Image("background-space")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack (spacing: 100) {
                
                HStack (spacing: 64) {
                    
                    Button(action: {
                        withAnimation {
                            // Ação para a seta da esquerda com animação
                            currentIndex = (currentIndex - 1 + images.count) % images.count
                        }
                    }) {
                        Image.theme.arrowLeft
                    }
                    
                    Image(images[currentIndex])
                        .resizable()
                        .scaledToFit()
                        .opacity(1) // Define a opacidade da imagem atual como 1 para exibi-la no centro
                        .animation(.easeInOut(duration: 0.5))
                    
                    
                    Button(action: {
                        withAnimation {
                            // Ação para a seta da direita com animação
                            currentIndex = (currentIndex + 1) % images.count
                        }
                    }) {
                        
                        Image.theme.arrowRight
                        
                    }
                    
                }
                .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.33)
                
                VStack {
                    Text("Choose your planet's name")
                        .foregroundColor(Color.accentColor)
                        .font(.custom(.vt323, size: 40))
                        .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.04, alignment: .leading)
                    
                    ZStack(alignment: .leading) {
                        TextField("", text: $namePlanet)
                            .padding()
                            .background(Color.clear)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .foregroundColor(.white)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.056, alignment: .leading)
                    }
                }
                
                VStack {
                    Text("Choose your planet's gravity value")
                        .foregroundColor(Color.accentColor)
                        .font(.custom(.vt323, size: 40))
                        .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.04, alignment: .leading)
                    
                    ZStack(alignment: .leading) {
                        TextField("", text: $gravityPlanet)
                            .padding()
                            .background(Color.clear)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .foregroundColor(.white)
                            .keyboardType(.numberPad)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.056, alignment: .leading)
                    }
                }
                
                Button(action: {
                    
                }) {
                    Image.theme.simulateButton
                        .frame(width: UIScreen.getScreenWidth() * 0.34, height: UIScreen.getScreenHeight() * 0.05)
                }

                
            }
        }
    }
}


struct CreatePlanetView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlanetView()
    }
}


