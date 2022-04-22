//
//  InformationView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

struct InformationView: View {
    var title: String?
    var message: String?
    var buttonText: String?
    var onButtonTapped: () -> Void
    
    var body: some View {
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
                        onButtonTapped()
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
