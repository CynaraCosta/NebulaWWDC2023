//
//  SwiftUIView.swift
//  
//
//  Created by Cynara Costa on 05/04/23.
//

import SwiftUI

struct OnboardingTextComponent: View {
    
    let widthScreen = UIScreen.main.bounds.width
    let heightScreen = UIScreen.main.bounds.height
    let phrase: String
    
    var body: some View {
        
        ZStack (alignment: .init(horizontal: .center, vertical: .center)) {
            
            Image.theme.rectText
                .resizable()
                .scaledToFit()
                .frame(width: widthScreen * 0.88, height: heightScreen * 0.13)
            
            Text(phrase)
                .foregroundColor(Color.theme.accentOnboardingColor)
                .multilineTextAlignment(.center)
                .font(.custom(.vt323, size: 28))
                .frame(width: widthScreen * 0.85, height: heightScreen * 0.08)
                .padding(.bottom, 16)
            
        }

        
        
    }
}

struct OnboardingTextComponent_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTextComponent(phrase: "Welcome to this interplanetary experience! We are excited to have you on board on this journey across the universe. Here is some information to help you get started")
    }
}
