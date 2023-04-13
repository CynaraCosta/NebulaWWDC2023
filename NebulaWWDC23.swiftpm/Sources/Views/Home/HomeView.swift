import SwiftUI

struct HomeView: View {
    
    @State var isPlusButtonSelected = false
    @State var isJupiterSelected = false
    @State var isEarthSelected = false
    @State var isMercurySelected = false
    @State var isNewPlanetSelected = false
    
//    @StateObject var homeViewModel: HomeViewModel
//    @StateObject var planetsViewModel: Planets
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var planetsViewModel: Planets
    
    init() {
//        _planetsViewModel = StateObject(wrappedValue: Planets())
//        _homeViewModel = StateObject(wrappedValue: HomeViewModel())
    }
    
    var body: some View {
        
        ZStack {
            
            Background()
            
            
            VStack (spacing: 56) {
                
                if !homeViewModel.addNewPlanet {
                    NavigationLink(destination:
                                    CreatePlanetView()
                        .environmentObject(homeViewModel)
                        .environmentObject(planetsViewModel), isActive: $isPlusButtonSelected, label: {
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
                    NavigationLink(destination: StartView(), isActive: $isNewPlanetSelected, label: {
                        Button(action: {
                            isNewPlanetSelected.toggle()
                        }) {

                            planetsViewModel.planets[3].portraitImage
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
