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
    
    public init(
        title: String,
        theme: Theme,
        compact: Bool = false
    ) {
        self.title = title
        self.theme = theme
        self.compact = compact
    }
    
    public var body: some View {
        Text(title)
            .font(.jetBrainsMonoTitle2)
            .multilineTextAlignment(.center)
            .lineSpacing(20)
            .padding(.horizontal, 25)
            .padding(.vertical, 33)
            .frame(width: self.compact == true ? 620 : .infinity)
            .background(self.theme == .light ? Color.paleBrown100 : Color.dark100)
            .foregroundColor(self.theme == .light ? Color.dark100 : Color.paleBrown100)
            .cornerRadius(16)
            .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(self.theme == .light ? Color.dark100 : .white, lineWidth: 2)
            )
    }
}

struct ConsigneTextView_Previews: PreviewProvider {
    static var previews: some View {
        ConsigneTextView(title: "Soutenir Carla dans la suite des interactions", theme: .light, compact: true)
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}
