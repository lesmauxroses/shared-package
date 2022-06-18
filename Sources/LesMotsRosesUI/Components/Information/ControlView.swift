//
//  ControlView.swift
//  
//
//  Created by Killian Sowa on 14/06/2022.
//

import Foundation
import SwiftUI

public struct ControlView: View {
    let theme: Theme
    let title: String
    @Binding var showButton: Bool
    var buttonText: String?
    var action: (() -> Void)?
    
    public init(
        theme: Theme,
        title: String,
        showButton: Bool = true,
        buttonText: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.theme = theme
        self.title = title
        self.buttonText = buttonText
        self.action = action
        self.showButton = (action == nil ? false : showButton)
    }
    
    public var body: some View {
        ZStack {
            VStack {
                Image("CompoEye")
                
                Spacer()
                    .frame(height: 80)
                
                Text(title)
                    .font(.josefinSansLargeTitle)
                    .foregroundColor(self.theme == .light ? Color.dark100 : Color.paleBrown100)
                    .frame(maxWidth: 670)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                if(action != nil && self.showButton == true) {
                    BasicButton(buttonText: self.buttonText, onTap: {
                        action!()
                    })
                }
//                if let action = action {
//                    BasicButton(buttonText: self.buttonText, onTap: {
//                        action()
//                    })
//                }
                
            }.frame(height: 450)
             .offset(y: 100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .modifier(NoiseBackgroundWithPattern(theme: self.theme, pattern: .control))
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(theme: .light, title: "Déposez votre badge ") {
            print("vlique")
        }
            .previewLayout(.fixed(width: 1133, height: 744))
    }
}

