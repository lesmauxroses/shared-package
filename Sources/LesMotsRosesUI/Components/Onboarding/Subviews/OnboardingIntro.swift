//
//  OnboardingIntro.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI
import AVKit

public struct OnboardingIntro: View {
    let captions: [Caption]
    var captionsDelay: CGFloat = 0
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "anim_eye", ofType: "mp4")!))
    
    public init(captions: [Caption], captionsDelay: CGFloat = 0) {
        self.captions = captions
        self.captionsDelay = captionsDelay
    }
    
    public var body: some View {
        ZStack {
            PlayerView(player: player)
                .onAppear {
                    NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
                        self.player.seek(to: .zero)
                        self.player.play()
                    }
                    
                    self.player.play()
                }
            
            VStack {
                Spacer()
                
                Image("illu_eye_big_dark")
                    .padding(.bottom, 30)
                    .opacity(0)
                
                Image("title_welcome")
                    .padding(.bottom, 120)
                
                CaptionsView(captions: captions, delay: captionsDelay)
            }        .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}
