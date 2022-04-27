//
//  OnboardingMission.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

struct OnboardingMission: View {
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    @State private var shouldPassView = false
    
    var body: some View {
        VStack {
            Text("Votre mission")
            Text("Répondez à 4 questions sur les personnalités de vos personnages de séries et films, dans un temps limite de 10 minutes.")
                .font(.josefinSansTitle1)
        }
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color.paleBrown100)
    }
}
