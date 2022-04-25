//
//  OnboardingWelcome.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

struct OnboardingWelcome: View {
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    @State private var shouldPassView = false
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: OnboardingIntro().environmentObject(onboardingViewModel),
                isActive: $shouldPassView
            ) { EmptyView() }
            
            Group {
                Text("Bienvenue dans la première interaction !")
                    .font(.josefinSansLargeTitle)
                Text("Déposez votre badge sur le socle pour lancer l’interaction")
                    .font(.josefinSansTitle1)
            }.foregroundColor(Color.paleBrown100)
        }.onChange(of: onboardingViewModel.onboardingStep) { newStep in
            if newStep == 2 {
                shouldPassView = true
            }
        }.background(Color.dark100)
    }
}
