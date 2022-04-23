//
//  BasicButtonStyle.swift
//  
//
//  Created by Killian Sowa on 23/04/2022.
//
import SwiftUI

public struct BasicButtonStyle: ButtonStyle {
    var type: ButtonType
    var height: CGFloat? = 64
    var fontSize: CGFloat = 24
    var horizontalPadding: CGFloat? = 40
    
    public init(type: ButtonType = .primary, height: CGFloat? = 64, fontSize: CGFloat = 24, horizontalPadding: CGFloat? = 40) {
        self.type = type
        self.height = height
        self.fontSize = fontSize
        self.horizontalPadding = horizontalPadding
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(height: height, alignment: .center)
            .padding(.horizontal, 40)
            .background(type == .primary ? Color.purple100 : Color.paleBrown100)
            .font(.custom("JosefinSans-SemiBold", size: fontSize))
            .foregroundColor(type == .primary ? .white : Color.dark100)
            .cornerRadius(16)
    }
}
