//
//  OnboardingIntro.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

struct OnboardingIntro: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("illu_eye_big_dark")
                .padding(.bottom, 30)
            
            Image("title_welcome")
                .padding(.bottom, 120)
            
            Text("Heureuse de vous retrouver pour cette mission")
                .font(.josefinSansTitle1)
                .foregroundColor(Color.dark100)
                .padding(.bottom, 75)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .modifier(NoiseBackground(type: .light))
    }
}
