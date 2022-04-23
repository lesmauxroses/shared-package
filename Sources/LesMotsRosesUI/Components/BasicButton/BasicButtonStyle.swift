//
//  BasicButtonStyle.swift
//  
//
//  Created by Killian Sowa on 23/04/2022.
//
import SwiftUI

struct BasicButtonStyle: ButtonStyle {
    var height: CGFloat? = 64
    var fontSize: CGFloat = 24
    var horizontalPadding: CGFloat? = 40
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(height: height, alignment: .center)
            .padding(.horizontal, 40)
            .background(Color.purple100)
            .font(.custom("JosefinSans-SemiBold", size: fontSize))
            .foregroundColor(.white)
            .cornerRadius(16)
    }
}
