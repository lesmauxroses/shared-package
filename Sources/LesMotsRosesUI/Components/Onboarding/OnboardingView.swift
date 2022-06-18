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
    var introCaptionsDelay: CGFloat
    var missionCaptionsDelay: CGFloat
    
    public init(
        onboardingStep: State<Int>,
        missionNumber: Int?,
        missionIllu: String,
        introCaptions: [Caption],
        missionCaptions: [Caption],
        introCaptionsDelay: CGFloat,
        missionCaptionsDelay: CGFloat
    ) {
        self._onboardingStep = onboardingStep
        self.missionNumber = missionNumber
        self.missionIllu = missionIllu
        self.introCaptions = introCaptions
        self.missionCaptions = missionCaptions
        self.introCaptionsDelay = introCaptionsDelay
        self.missionCaptionsDelay = missionCaptionsDelay
    }
    
    public var body: some View {
        VStack {
            switch onboardingStep {
            case 1:
                OnboardingWelcome()
            case 2:
                OnboardingIntro(
                    captions: introCaptions,
                    captionsDelay: introCaptionsDelay
                )
            case 3:
                OnboardingMission(
                    missionNumber: missionNumber,
                    missionIllu: missionIllu,
                    captions: missionCaptions,
                    captionsDelay: missionCaptionsDelay
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
            missionCaptions: [],
            introCaptionsDelay: 1,
            missionCaptionsDelay: 1
        )
    }
}
