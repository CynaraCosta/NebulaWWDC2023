import SwiftUI

struct Background: View {
    var body: some View {
        Image.theme.background
            .resizable()
            .ignoresSafeArea(.all)
    }
}
