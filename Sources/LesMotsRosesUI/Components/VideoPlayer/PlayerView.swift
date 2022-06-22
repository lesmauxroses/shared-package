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

public struct PlayerView: UIViewRepresentable {
    var player: AVPlayer?
    
    public init() {
    }
    
    var isTransparent = true
    
    private static let transparentPixelBufferAttributes = [
      kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]

    public func makeUIView(context: Context) -> AVPlayerView {
        return AVPlayerView()
    }

    public func updateUIView(_ playerView: AVPlayerView, context: Context) {
        playerView.player = player
        
        playerView.playerLayer.pixelBufferAttributes =
        isTransparent ? Self.transparentPixelBufferAttributes : nil
    }
}

public class AVPlayerView: UIView {
    public override class var layerClass: AnyClass {
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

