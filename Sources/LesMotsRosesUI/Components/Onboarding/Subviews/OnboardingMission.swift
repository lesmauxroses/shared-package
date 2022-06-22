//
//  OnboardingMission.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI
import AVKit

public struct OnboardingMission: View {
    var missionNumber: Int? = nil
    let missionIllu: String
    let captions: [Caption]
    var captionsDelay: CGFloat = 0
    var hasVideo: Bool = true
    
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "anim_mission", ofType: "mp4")!))
    
    public init(
        missionNumber: Int?,
        missionIllu: String,
        captions: [Caption],
        captionsDelay: CGFloat = 0,
        hasVideo: Bool = true
    ) {
        self.missionNumber = missionNumber
        self.missionIllu = missionIllu
        self.captions = captions
        self.captionsDelay = captionsDelay
        self.hasVideo = hasVideo
    }
    
    public var body: some View {
        ZStack {
            if hasVideo {
                PlayerView(player: player)
                    .onAppear {
                        self.player.play()
                    }
            }
            
            VStack(spacing: 30) {
                Spacer()
                
                HStack {
                    Image("mission_title")
                }.opacity(hasVideo ? 0 : 1)
                
                Image(missionIllu)
                    .padding(.bottom, 90)
                    .animation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true))
                
                CaptionsView(captions: captions, delay: captionsDelay)

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.paleBrown100)
        .overlay(Image("pattern-overlay-mission").resizable())
        .ignoresSafeArea()
    }
}

struct OnboardingMission_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingMission(
            missionNumber: 1,
            missionIllu: "",
            captions: [Caption(text: "Passons au détail de votre mission : je vous propose de réaliser une première enquête...", time: 5)]
        )
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}
