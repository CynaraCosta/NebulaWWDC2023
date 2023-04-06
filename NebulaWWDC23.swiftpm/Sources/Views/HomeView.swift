import SwiftUI

struct HomeView: View {
    
    @State var isPlusButtonSelected = false
    @State var isJupiterSelected = false
    @State var isEarthSelected = false
    @State var isMercurySelected = false
    
    var planetsViewModel = Planets()
    
    var body: some View {
        
        ZStack {
            
            Background()
            
            
            VStack (spacing: 56) {
                
                Button(action: {
                    isPlusButtonSelected.toggle()
                }) {
                    Image.theme.plusButton
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.getScreenWidth() * 0.2, height: UIScreen.getScreenHeight() * 0.14)
                }
                
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
