//
//  OnboardingView.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

public struct OnboardingView: View {
    @State var onboardingStep: Int
    var familyName: String? = nil
    var missionNumber: Int? = nil
    let missionText: String
    let timeAvailable: Int
    
    public init(
        onboardingStep: State<Int>,
        missionNumber: Int?,
        missionText: String,
        timeAvailable: Int
    ) {
        self._onboardingStep = onboardingStep
        self.missionNumber = missionNumber
        self.missionText = missionText
        self.timeAvailable = timeAvailable
    }
    
    public var body: some View {
        switch onboardingStep {
        case 1:
            OnboardingIntro()
        case 2:
            OnboardingWelcome()
        case 3:
            OnboardingMission(
                missionNumber: missionNumber,
                missionText: missionText,
                timeAvailable: timeAvailable
            )
        default:
            EmptyView()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(
            onboardingStep: State(initialValue: 1),
            missionNumber: 1,
            missionText: "Analysez la présence des femmes dans un film ou une série, à partir du test de Bechdel",
            timeAvailable: 5
        )
    }
}
