//
//  OnboardingIntro.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

struct OnboardingIntro: View {
    var body: some View {
        VStack(spacing: 150) {
            Image("illu_eye_big_dark")
            
            Text("Bonjour et bienvenue la famille Rnard ! ")
                .font(.josefinSansTitle1)
                .foregroundColor(Color.dark100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .modifier(NoiseBackground(type: .light))
    }
}
