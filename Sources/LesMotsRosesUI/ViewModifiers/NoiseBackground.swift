//
//  NoiseBackground.swift
//  
//
//  Created by Killian Sowa on 28/04/2022.
//

import SwiftUI

public struct NoiseBackground: ViewModifier {
    let type: NoiseBackgroundType
    
    public init(type: NoiseBackgroundType) {
        self.type = type
    }
    
    public func body(content: Content) -> some View {
        content
            .background(type == .dark ? Image("bg_noise_dark").resizable() : type == .medium ? Image("bg_noise_purple").resizable() : Image("bg_noise_palebrown").resizable())
    }
}

public enum NoiseBackgroundType {
    case dark, medium, light
}
