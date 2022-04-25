//
//  OnboardingView.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

public struct OnboardingView: View {
    @State var onboardingStep: Int
    @StateObject var viewModel = OnboardingViewModel()
    
    public var body: some View {
        NavigationView {
            OnboardingWelcome().environmentObject(viewModel)
        }.onChange(of: onboardingStep) { newStep in
            viewModel.onboardingStep = newStep
        }
    }
}
