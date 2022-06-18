//
//  OnboardingIntro.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

struct OnboardingIntro: View {
    @State var bouncing: Bool = false
    let captions: [Caption]
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("illu_eye_big_dark")
                .padding(.bottom, 30)
                .offset(y: bouncing ? -30 : 0)
                .animation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true))
            
            Image("title_welcome")
                .padding(.bottom, 120)
            
            CaptionsView(captions: captions)
        }
        .onAppear {
            self.bouncing.toggle()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .modifier(NoiseBackgroundWithPattern(theme: .light, pattern: .onboardingIntro))
    }
}
