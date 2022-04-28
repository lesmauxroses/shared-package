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
            
            VStack(spacing: 150) {
                Image("illu_eye_big")
                
                VStack(spacing: 20) {
                    Text("Bienvenue dans la troisème expérience !")
                        .font(.josefinSansLargeTitle)
                    Text("Déposez votre badge sur le socle devant vous pour lancer l’interaction")
                        .font(.josefinSansTitle1)
                }
            }.foregroundColor(Color.paleBrown100)
            
            Spacer()
        }.onChange(of: onboardingViewModel.onboardingStep) { newStep in
            if newStep == 2 {
                shouldPassView = true
            }
        }
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.dark100)
    }
}
