//
//  BasicButtonStyle.swift
//  
//
//  Created by Killian Sowa on 23/04/2022.
//
import SwiftUI

public struct BasicButtonStyle: ButtonStyle {
    let type: ButtonType
    @State var isSelected: Bool
    var height: CGFloat? = 64
    var fontSize: CGFloat = 24
    var horizontalPadding: CGFloat? = 40
    
    public init(
        type: ButtonType = .primary,
        isSelected: State<Bool>,
        height: CGFloat? = 64,
        fontSize: CGFloat = 24,
        horizontalPadding: CGFloat? = 40
    ) {
        self.type = type
        self._isSelected = isSelected
        self.height = height
        self.fontSize = fontSize
        self.horizontalPadding = horizontalPadding
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(height: height, alignment: .center)
            .padding(.horizontal, 40)
            .background(type == .primary ? Color.purple100 : isSelected ? Color.dark100 : Color.paleBrown100)
            .font(.custom("JosefinSans-SemiBold", size: fontSize))
            .foregroundColor(type == .primary ? .white : isSelected ? Color.paleBrown100 : Color.dark100)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.dark100, lineWidth: type == .secondary ? 2 : 0)
            )
    }
}
