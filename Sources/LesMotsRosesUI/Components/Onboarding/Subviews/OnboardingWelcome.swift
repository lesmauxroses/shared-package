//
//  OnboardingWelcome.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

struct OnboardingWelcome: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("interaction_logo")
                .padding(.bottom, 210)
            
            Spacer()
            
            Text("Déposez votre badge sur le socle devant vous pour démarrer la mission")
                .font(.josefinSansTitle1)
                .padding(.bottom, 75)
        }.foregroundColor(Color.paleBrown100)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .modifier(NoiseBackground(type: .dark))
    }
}
