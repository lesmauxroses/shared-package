//
//  OnboardingView.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

public struct OnboardingView: View {
    @State var onboardingStep: Int
    var missionNumber: Int? = nil
    var missionIllu: String
    var introCaptions: [Caption]
    var missionCaptions: [Caption]
    
    public init(
        onboardingStep: State<Int>,
        missionNumber: Int?,
        missionIllu: String,
        introCaptions: [Caption],
        missionCaptions: [Caption]
    ) {
        self._onboardingStep = onboardingStep
        self.missionNumber = missionNumber
        self.missionIllu = missionIllu
        self.introCaptions = introCaptions
        self.missionCaptions = missionCaptions
    }
    
    public var body: some View {
        VStack {
            switch onboardingStep {
            case 1:
                OnboardingWelcome()
            case 2:
                OnboardingIntro(captions: introCaptions)
            case 3:
                OnboardingMission(
                    missionNumber: missionNumber,
                    missionIllu: missionIllu,
                    captions: missionCaptions
                )
            default:
                EmptyView()
            }
        }        .animation(Animation.easeInOut(duration: 1), value: onboardingStep)
            .transition(.opacity)

    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(
            onboardingStep: State(initialValue: 1),
            missionNumber: 1,
            missionIllu: "",
            introCaptions: [],
            missionCaptions: []
        )
    }
}
