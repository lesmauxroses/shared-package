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
                
                Image("title_welcome")
                    .padding(.bottom, 120)
                
                CaptionsView(captions: captions, delay: captionsDelay)
            }        .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(Image("pattern-overlay-intro").resizable())
        .ignoresSafeArea()
    }
}


struct OnboardingIntron_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            OnboardingIntro(captions: [Caption(text: "fzefezfzzffzefezfzffef", time: 5)])
        }                .previewLayout(.fixed(width: 1920, height: 1080))

    }
}
