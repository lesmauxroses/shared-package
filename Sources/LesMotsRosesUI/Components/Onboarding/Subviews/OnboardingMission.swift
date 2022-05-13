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
        VStack(spacing: 30) {
            Group {
                Image("mission_title")
                Image("mission_goals")
            }.blendMode(.normal)
        }
        #if os(iOS)
            .navigationBarHidden(true)
        #endif
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .modifier(NoiseBackground(type: .light))
    }
}
