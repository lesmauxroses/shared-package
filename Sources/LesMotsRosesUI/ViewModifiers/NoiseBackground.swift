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
            .background(type == .dark ? Color.dark100 : type == .medium ? Color.purple100 : Color.paleBrown100)
            .blendMode(.lighten)
            .background(Image("bg-grain").resizable())
    }
}

public enum NoiseBackgroundType {
    case dark, medium, light
}
