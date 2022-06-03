//
//  InstructionView.swift
//  
//
//  Created by Killian Sowa on 03/06/2022.
//

import SwiftUI

struct InstructionView: View {
    let text: String
    let type: InstructionType
    
    var body: some View {
        let color = type == .light ? Color.paleBrown100 : Color.dark100
        
        Text(text)
            .font(.josefinBody)
            .foregroundColor(color)
            .padding(25)
            .overlay(RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(color, lineWidth: 2))
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView(
            text: "Ceci est une instruction",
            type: .light
        )
    }
}


enum InstructionType: String {
    case light, dark
}
