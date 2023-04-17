import SwiftUI
import Combine


struct CreatePlanetView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var planetViewModel: Planets
    @EnvironmentObject var createNewPlanetViewModel: CreateNewPlanetViewModel

    var body: some View {
        ZStack {
            Image.theme.background
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack (spacing: 56) {
                
                HStack (spacing: 64) {
                    
                    Button(action: {
                        withAnimation {
                            
                            createNewPlanetViewModel.removeCurrentIndexToGetPreviousImage()
                        }
                    }) {
                        Image.theme.arrowLeft
                    }
                    
                    Image(createNewPlanetViewModel.imagesPlanet[createNewPlanetViewModel.currentIndex])
                        .resizable()
                        .scaledToFit()
                    
                    
                    Button(action: {
                        withAnimation {
                            
                            createNewPlanetViewModel.addCurrentIndexToGetNextImage()
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
                        TextField("", text: $createNewPlanetViewModel.namePlanet)
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
                            .onReceive(Just(createNewPlanetViewModel.namePlanet)) { newValue in
                                let filteredValue = createNewPlanetViewModel.filterString(newValue, allowedCharacters: createNewPlanetViewModel.allowedCharactersForName)
                                if filteredValue != newValue {
                                    self.createNewPlanetViewModel.namePlanet = filteredValue
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
                        TextField("", text: $createNewPlanetViewModel.gravityPlanet)
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
                            .onReceive(Just(createNewPlanetViewModel.gravityPlanet)) { newValue in
                                let filteredValue = createNewPlanetViewModel.filterString(newValue, allowedCharacters: createNewPlanetViewModel.allowedCharactersForGravityValue)
                                if filteredValue != newValue {
                                    self.createNewPlanetViewModel.gravityPlanet = filteredValue
                                }
                                
                            }
                            .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.056, alignment: .leading)
                        
                    }
                }
                
                VStack (spacing: 16) {
                    if !createNewPlanetViewModel.validateFields {
                        Text("Please fill in all fields!")
                            .font(.custom(.vt323, size: 20))
                            .foregroundColor(Color.red)
                            .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.05, alignment: .leading)
                    }
                    
                    if !createNewPlanetViewModel.validateName {
                        Text("Be creative! You can choose any name you please, but Earth, Jupiter or Mercury are already between us...")
                            .font(.custom(.vt323, size: 20))
                            .foregroundColor(Color.red)
                            .frame(width: UIScreen.getScreenWidth() * 0.77, height: UIScreen.getScreenHeight() * 0.05, alignment: .leading)
                    }
                }
                
                NavigationLink(destination: HomeView(), isActive: $homeViewModel.addNewPlanet) {EmptyView()}
                Button(action: {
                    
                    // need to change the values
                    createNewPlanetViewModel.whichColorPlanet()
                    if createNewPlanetViewModel.returnFromAddButton() {
                        planetViewModel.addPlanet(
                            name: createNewPlanetViewModel.namePlanet,
                            portraitImage: createNewPlanetViewModel.getPortraitImage(),
                            model3d: "",
                            gravityValue: createNewPlanetViewModel.treatFloat(),
                            positionFromSun: "",
                            groundImage: createNewPlanetViewModel.getGroundImage(),
                            backgroundImage: createNewPlanetViewModel.getBackgroundImage(),
                            distanceFromSun: "",
                            groundExtended: createNewPlanetViewModel.getExtendedGroundImage())
                        homeViewModel.addNewPlanet.toggle()
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



