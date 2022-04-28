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
    
    public init(onboardingStep: State<Int>) {
        self._onboardingStep = onboardingStep
    }
    
    public var body: some View {
        NavigationView {
            OnboardingWelcome()
                .environmentObject(viewModel)
        }.onChange(of: onboardingStep) { newStep in
            viewModel.onboardingStep = newStep
        }
        .navigationBarHidden(true)
        .navigationViewStyle(.stack)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(onboardingStep: State(initialValue: 1))
    }
}
