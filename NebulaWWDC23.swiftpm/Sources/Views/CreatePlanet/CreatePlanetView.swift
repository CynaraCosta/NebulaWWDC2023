import SwiftUI
import Combine


struct CreatePlanetView: View {
//    @StateObject var CreateNewPlanetViewModel: CreateNewPlanetViewModel
    @State private var namePlanet: String = ""
    @State private var gravityPlanet: String = ""
    @State private var currentIndex: Int = 0
    
    @State private var validateFields = true
    @State private var validateName = true
    
    @State var createNewPlanetVM = CreateNewPlanetViewModel()
    
    let images = ["sample-planet"]
    
    var body: some View {
        ZStack {
            Image("background-space")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack (spacing: 56) {
                
                HStack (spacing: 64) {
                    
                    Button(action: {
                        withAnimation {
                            
                            currentIndex = (currentIndex - 1 + images.count) % images.count
                        }
                    }) {
                        Image.theme.arrowLeft
                    }
                    
                    Image(images[currentIndex])
                        .resizable()
                        .scaledToFit()
                    
                    
                    Button(action: {
                        withAnimation {
                            
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
                            .onReceive(Just(namePlanet)) { newValue in
                                let filteredValue = createNewPlanetVM.filterString(newValue, allowedCharacters: createNewPlanetVM.allowedCharactersForName)
                                if filteredValue != newValue {
                                    self.namePlanet = filteredValue
                                }
                                
                            }
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
                            .keyboardType(.decimalPad)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .onReceive(Just(gravityPlanet)) { newValue in
                                let filteredValue = createNewPlanetVM.filterString(newValue, allowedCharacters: createNewPlanetVM.allowedCharactersForGravityValue)
                                if filteredValue != newValue {
                                    self.gravityPlanet = filteredValue
                                }
                                
                            }
                            .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.056, alignment: .leading)
                        
                    }
                    
                    
                }
                
                VStack (spacing: 16) {
                    if !validateFields {
                        Text("Please fill in all fields!")
                            .font(.custom(.vt323, size: 20))
                            .foregroundColor(Color.red)
                            .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.05, alignment: .leading)
                    }
                    
                    if !validateName {
                        Text("Be creative! You can choose any name you please, but Earth, Jupiter or Mercury are already between us...")
                            .font(.custom(.vt323, size: 20))
                            .foregroundColor(Color.red)
                            .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.05, alignment: .leading)
                    }
                }
                
                
                Button(action: {
                    if gravityPlanet == "" || namePlanet == ""{
                        validateFields = false
                    } else {
                        validateFields = true
                    }
                    
                    if namePlanet == "Earth" || namePlanet == "Jupiter" || namePlanet == "Mercury" {
                        validateName = false
                    } else {
                        validateName = true
                    }
                    
                }) {
                    Image.theme.simulateButton
                        .resizable()
                        .scaledToFit()
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



