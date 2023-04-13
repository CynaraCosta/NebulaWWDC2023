import SwiftUI

struct HomeView: View {
    
    @State var isPlusButtonSelected = false
    @State var isJupiterSelected = false
    @State var isEarthSelected = false
    @State var isMercurySelected = false
    @State var isNewPlanetSelected = false
    
    @StateObject private var homeViewModel: HomeViewModel
    @StateObject private var planetViewModel: Planets
    
    init() {
        _planetViewModel = StateObject(wrappedValue: Planets())
        _homeViewModel = StateObject(wrappedValue: HomeViewModel())
    }
    
    var planetsViewModel = Planets()
    
    var body: some View {
        
        ZStack {
            
            Background()
            
            
            VStack (spacing: 56) {
                
                if !homeViewModel.addNewPlanet {
                    NavigationLink(destination: CreatePlanetView(), isActive: $isPlusButtonSelected, label: {
                        Button(action: {
                            isPlusButtonSelected.toggle()
                        }) {

                            Image.theme.plusButton
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.getScreenWidth() * 0.2, height: UIScreen.getScreenHeight() * 0.14)

                        }
                    })
                } else {
                    NavigationLink(destination: StartView(), isActive: $homeViewModel.addNewPlanet, label: {
                        Button(action: {
                            
                        }) {

                            planetViewModel.planets[3].portraitImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.getScreenWidth() * 0.2, height: UIScreen.getScreenHeight() * 0.14)

                        }
                    })
                }
                
//                NavigationLink(destination: CreatePlanetView(), isActive: $isPlusButtonSelected, label: {
//                    Button(action: {
//                        isPlusButtonSelected.toggle()
//                    }) {
//
//                        Image.theme.plusButton
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: UIScreen.getScreenWidth() * 0.2, height: UIScreen.getScreenHeight() * 0.14)
                
                NavigationLink(destination: PlanetDetail(namePlanet: planetsViewModel.whichPlanet(named: "Jupiter")!.name),
                               isActive: $isJupiterSelected,
                               label: {
                    Button(action: {
                        isJupiterSelected.toggle()
                        print(homeViewModel.addNewPlanet)
                    }) {
                        Image.theme.planetJupiter
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.getScreenWidth() * 0.32, height: UIScreen.getScreenHeight() * 0.23)
                    }})
                
                NavigationLink(destination: PlanetDetail(namePlanet: planetsViewModel.whichPlanet(named: "Earth")!.name),
                               isActive: $isEarthSelected,
                               label: {
                    Button(action: {
                        isEarthSelected.toggle()
                    }) {
                        Image.theme.planetEarth
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.getScreenWidth() * 0.26, height: UIScreen.getScreenHeight() * 0.18)
                    }})
                
                
                NavigationLink(destination: PlanetDetail(namePlanet: planetsViewModel.whichPlanet(named: "Mercury")!.name),
                               isActive: $isMercurySelected,
                               label: {
                    Button(action: {
                        isMercurySelected.toggle()
                    }) {
                        Image.theme.planetMercury
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.getScreenWidth() * 0.2, height: UIScreen.getScreenHeight() * 0.14)
                    }
                })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
