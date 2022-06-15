//
//  File.swift
//  
//
//  Created by Killian Sowa on 15/06/2022.
//

import Foundation
import AVKit

public func playSound(player: inout AVAudioPlayer, sound: String) {
    let voice = Bundle.main.path(forResource: sound, ofType: "mp3")
    player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: voice!))
    player.play()
}
