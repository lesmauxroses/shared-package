//
//  ConsigneTextView.swift
//  
//
//  Created by Killian Sowa on 14/06/2022.
//

import Foundation
import SwiftUI

public struct ConsigneTextView: View {
    let title: String
    let theme: Theme
    let compact: Bool?
    let maxWidth: CGFloat?
    let horizontalPadding: CGFloat?
    let verticalPadding: CGFloat?
    
    public init(
        title: String,
        theme: Theme,
        compact: Bool = false,
        maxWidth: CGFloat? = .infinity,
        horizontalPadding: CGFloat = 25,
        verticalPadding: CGFloat = 33
    ) {
        self.title = title
        self.theme = theme
        self.compact = compact
        self.maxWidth = maxWidth
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }
    
    public var body: some View {
        Text(title)
            .font(.jetBrainsMonoTitle2)
            .multilineTextAlignment(.center)
            .lineSpacing(10)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: self.compact == true ? 620 : maxWidth)
            .background(self.theme == .light ? Color.paleBrown100 : Color.dark100)
            .foregroundColor(self.theme == .light ? Color.dark100 : Color.paleBrown100)
            .cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(self.theme == .light ? Color.dark100 : .white, lineWidth: 2))
    }
}

struct ConsigneTextView_Previews: PreviewProvider {
    static var previews: some View {
        ConsigneTextView(title: "Soutenir Carla dans la suite des interactions", theme: .light, compact: true)
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}
