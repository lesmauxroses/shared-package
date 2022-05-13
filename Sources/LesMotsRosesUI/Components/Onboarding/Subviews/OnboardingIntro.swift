//
//  OnboardingIntro.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

struct OnboardingIntro: View {
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    @State private var shouldPassView = false
    
    var body: some View {
        VStack(spacing: 150) {
            NavigationLink(
                destination: OnboardingMission(),
                isActive: $shouldPassView
            ) { EmptyView() }
            
            Image("illu_eye_big_dark")
            
            Text("Bonjour et bienvenue la famille Rnard ! ")
                .font(.josefinSansTitle1)
                .foregroundColor(Color.dark100)
        }.onChange(of: onboardingViewModel.onboardingStep) { newStep in
            if newStep == 3 {
                shouldPassView = true
            }
        }
        #if os(iOS)
           .navigationBarHidden(true)
        #endif
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .modifier(NoiseBackground(type: .light))
    }
}
