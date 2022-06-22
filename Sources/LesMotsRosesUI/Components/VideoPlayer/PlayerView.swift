//
//  File.swift
//  
//
//  Created by Killian Sowa on 22/06/2022.
//

import AVFoundation
import UIKit

import AVFoundation
import SwiftUI

struct PlayerView: UIViewRepresentable {
    var player: AVPlayer?
    
    var isTransparent = true
    
    private static let transparentPixelBufferAttributes = [
      kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]

    func makeUIView(context: Context) -> AVPlayerView {
        return AVPlayerView()
    }

    func updateUIView(_ playerView: AVPlayerView, context: Context) {
        playerView.player = player
        
        playerView.playerLayer.pixelBufferAttributes =
        isTransparent ? Self.transparentPixelBufferAttributes : nil
    }
}

class AVPlayerView: UIView {
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }

    var player: AVPlayer? {
        set { playerLayer.player = newValue }
        get { return playerLayer.player }
    }
}

