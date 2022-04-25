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
            Spacer()
            
            NavigationLink(
                destination: OnboardingIntro().environmentObject(onboardingViewModel),
                isActive: $shouldPassView
            ) { EmptyView() }
            
            VStack(spacing: 20) {
                Image("illu_eye_big")
                
                Text("Bienvenue dans la première interaction !")
                    .font(.josefinSansLargeTitle)
                Text("Déposez votre badge sur le socle pour lancer l’interaction")
                    .font(.josefinSansTitle1)
            }.foregroundColor(Color.paleBrown100)
            
            Spacer()
        }.onChange(of: onboardingViewModel.onboardingStep) { newStep in
            if newStep == 2 {
                shouldPassView = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.dark100)
    }
}
