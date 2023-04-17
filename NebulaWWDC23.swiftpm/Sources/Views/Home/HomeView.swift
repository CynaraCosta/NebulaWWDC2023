import SwiftUI

struct HomeView: View {
    
    @State var isPlusButtonSelected = false
    @State var isJupiterSelected = false
    @State var isEarthSelected = false
    @State var isMercurySelected = false
    @State var isNewPlanetSelected = false
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var planetsViewModel: Planets
    @EnvironmentObject var createNewPlanetViewModel: CreateNewPlanetViewModel
    
    var body: some View {
        
        ZStack {
            
            Background()
            
            
            VStack (spacing: 56) {
                
                if !homeViewModel.addNewPlanet {
                    NavigationLink(destination:
                                    CreatePlanetView()
                        .environmentObject(homeViewModel)
                        .environmentObject(planetsViewModel)
                        .environmentObject(createNewPlanetViewModel),
                                   isActive: $isPlusButtonSelected, label: {
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
                    NavigationLink(destination: NewPlanetChooseSimulation(namePlanet: planetsViewModel.whichPlanet(named: planetsViewModel.planets[3].name)!.name)
                        .environmentObject(planetsViewModel)
                        .environmentObject(homeViewModel)
                        .environmentObject(createNewPlanetViewModel), isActive: $isNewPlanetSelected, label: {
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
                
                NavigationLink(destination: PlanetDetail(namePlanet: planetsViewModel.whichPlanet(named: "Jupiter")!.name)
                    .environmentObject(planetsViewModel)
                    .environmentObject(createNewPlanetViewModel),
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
                
                NavigationLink(destination: PlanetDetail(namePlanet: planetsViewModel.whichPlanet(named: "Earth")!.name)
                    .environmentObject(planetsViewModel)
                    .environmentObject(createNewPlanetViewModel),
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
                
                
                NavigationLink(destination: PlanetDetail(namePlanet: planetsViewModel.whichPlanet(named: "Mercury")!.name)
                    .environmentObject(planetsViewModel)
                    .environmentObject(createNewPlanetViewModel),
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
