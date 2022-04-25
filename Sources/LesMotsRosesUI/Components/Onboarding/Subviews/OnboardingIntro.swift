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
        VStack {
            NavigationLink(
                destination: OnboardingMission(),
                isActive: $shouldPassView
            ) { EmptyView() }
            
            Text("Oeil ici")
            Text("Bonjour et bienvenue la famille Rnard ! ")
                .font(.josefinSansTitle1)
                .foregroundColor(Color.dark100)
        }.onChange(of: onboardingViewModel.onboardingStep) { newStep in
            if newStep == 3 {
                shouldPassView = true
            }
        }.background(Color.paleBrown100)
    }
}