//
//  OnboardingIntro.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

public struct OnboardingIntro: View {
    @State var bouncing: Bool = false
    let captions: [Caption]
    var captionsDelay: CGFloat = 0
    
    public init(captions: [Caption], captionsDelay: CGFloat = 0) {
        self.captions = captions
        self.captionsDelay = captionsDelay
    }
    
    public var body: some View {
        VStack {
            Spacer()
            
            Image("illu_eye_big_dark")
                .padding(.bottom, 30)
                .offset(y: bouncing ? -15 : 0)
                .animation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true))
            
            Image("title_welcome")
                .padding(.bottom, 120)
            
            CaptionsView(captions: captions, delay: captionsDelay)
        }
        .onAppear {
            self.bouncing.toggle()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}
