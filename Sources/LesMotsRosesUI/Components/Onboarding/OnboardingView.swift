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
    var missionIllu: String
    
    public init(
        onboardingStep: State<Int>,
        missionNumber: Int?,
        missionIllu: String
    ) {
        self._onboardingStep = onboardingStep
        self.missionNumber = missionNumber
        self.missionIllu = missionIllu
    }
    
    public var body: some View {
        VStack {
            switch onboardingStep {
            case 1:
                OnboardingWelcome()
            case 2:
                OnboardingIntro()
            case 3:
                OnboardingMission(
                    missionNumber: missionNumber,
                    missionIllu: missionIllu
                )
            default:
                EmptyView()
            }
        }        .animation(Animation.easeInOut(duration: 1), value: onboadingStep)
            .transition(.opacity)

    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(
            onboardingStep: State(initialValue: 1),
            missionNumber: 1,
            missionIllu: ""
        )
    }
}
