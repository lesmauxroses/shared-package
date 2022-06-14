//
//  BasicButton.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import Foundation
import SwiftUI

public struct BasicButton: View {
    let buttonText: String?
    let onTap: () -> Void
    
    public init(
        buttonText: String? = nil,
        onTap: @escaping () -> Void
    ) {
        self.buttonText = buttonText
        self.onTap = onTap
    }

    public var body: some View {
        VStack {
            if(self.buttonText != nil) {
                HStack (spacing: 15) {
                    Text(self.buttonText ?? "")
                        .font(.josefinBody)
                        .foregroundColor(Color.paleBrown100)
                    
                    Image("arrow")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.leading, 28)
                .padding(.trailing, 28)
                .padding(.top, 16)
                .padding(.bottom, 16)
                .background(Color.purple100)
                .cornerRadius(100)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.dark100, lineWidth: 2)
                )
            } else {
                Image("arrow")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .rotationEffect(Angle(degrees: -4))
                    .padding(15)
                    .background(Color.purple100)
                    .cornerRadius(100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color.dark100, lineWidth: 2)
                    )
            }
        }.onTapGesture {
            onTap()
        }
    }
}

struct BasicButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            BasicButton(onTap: {})
                .previewLayout(.fixed(width: 1920, height: 1080))
            
            BasicButton(buttonText: "Commencer le jeu", onTap: {})
        }

    }
}
