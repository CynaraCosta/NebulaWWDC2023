import SwiftUI

class CreateNewPlanetViewModel: ObservableObject {
    
    let allowedCharactersForName = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789._-&*ˆ%$#@!+=';"
    let allowedCharactersForGravityValue = "0123456789."
    
    func filterString(_ input: String, allowedCharacters: String) -> String {
        let filtered = input.filter { allowedCharacters.contains($0) }
        return filtered
    }

}


