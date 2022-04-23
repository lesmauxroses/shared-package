//
//  InformationView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct InformationView: View {
    let title: String?
    let message: String?
    let buttonText: String?
    var onButtonTapped: (() -> Void)?
    
    public init(title: String?, message: String?, buttonText: String?, onButtonTapped: (() -> Void)?) {
        self.title = title
        self.message = message
        self.buttonText = buttonText
        self.onButtonTapped = onButtonTapped
    }
    
    public var body: some View {
        ZStack {
            VStack(spacing: 60) {
                //                Image("illu-oeil").blendMode(.normal)
                
                if let title = title {
                    Text(title)
                        .foregroundColor(Color.white)
                        .font(.custom("JosefinSans-Bold", size: 52))
                }
                
                if let message = message {
                    Text(message)
                        .foregroundColor(Color.white)
                        .font(.custom("JosefinSans-Bold", size: 52))
                }
                
                if let buttonText = buttonText {
                    BasicButton(text: buttonText) {
                        if let onButtonTapped = onButtonTapped {
                            onButtonTapped()
                        }
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.purple)
            .blendMode(.lighten)
        //            .background(Image("bg-grain"))
            .ignoresSafeArea()
    }
}
