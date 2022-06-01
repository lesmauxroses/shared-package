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
            
            VStack(spacing: 150) {
                Image("interaction_logo")
                
                VStack(spacing: 20) {
                    Text("Déposez votre badge sur le socle devant vous pour lancer l’interaction")
                        .font(.josefinSansTitle1)
                }
            }.foregroundColor(Color.paleBrown100)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(NoiseBackground(type: .dark))
    }
}
