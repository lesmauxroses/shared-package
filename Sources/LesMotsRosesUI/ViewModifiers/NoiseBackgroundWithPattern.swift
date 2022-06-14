//
//  NoiseBackgroundWithPattern.swift
//  
//
//  Created by Killian Sowa on 14/06/2022.
//

import Foundation
import SwiftUI
import LesMotsRosesUI

public struct NoiseBackgroundWithPattern: ViewModifier {
    
    let theme: Theme
    var pattern: Pattern?
    var image: AnyView?
    
    public init(theme: Theme, pattern: Pattern? = nil, image: AnyView? = nil) {
        self.theme = theme
        self.pattern = pattern
        self.image = image
    }
    
    public func body(content: Content) -> some View {
        content
            .background(
                ZStack {
                    if(self.pattern != nil) {
                        Image(self.pattern!.rawValue)
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                    if(self.image != nil) {
                        image!
                    }
                    Image("bg-noise")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .blendMode(.colorDodge)
                }.background(self.theme == .light ? Color.paleBrown100 : Color.dark100)
            )
    }
}

public enum Pattern: String {
    case control = "pattern-control"
    case controlDark = "pattern-control-dark"
    case btc4 = "pattern-BTC-4"
    case btc5 = "pattern-BTC-5"
    case btc28 = "pattern-BTC-28"
    case controlCircle = "circle"
}
