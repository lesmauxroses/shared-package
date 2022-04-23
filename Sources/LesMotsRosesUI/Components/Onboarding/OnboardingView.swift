//
//  OnboardingView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct OnboardingView: View {
    let steps: [OnboardingStep]
    
    public init(steps: [OnboardingStep]) {
        self.steps = steps
    }
    
    public var body: some View {
        VStack {
            ForEach(Array(steps.enumerated()), id: \.element) { index, element in
                VStack {
                    Text("\(index)")
                        .padding(50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.purple100, lineWidth: 2)
                        )
                    
                    Image(element.imageName)
                    
                    Text(element.description)
                        .font(.josefinSans)
                        .padding(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.dark100, lineWidth: 2)
                        )
                }
            }
        }
    }
}
