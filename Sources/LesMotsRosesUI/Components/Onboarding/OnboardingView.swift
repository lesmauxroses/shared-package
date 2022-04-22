//
//  OnboardingView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct OnboardingView: View {
    var steps: [OnboardingStep]
    var buttonText: String
    var onButtonTapped: () -> Void
    
    public var body: some View {
        VStack {
            ForEach(steps) { step in
                
            }
            
            BasicButton(text: buttonText) {
                onButtonTapped()
            }
        }
    }
}
