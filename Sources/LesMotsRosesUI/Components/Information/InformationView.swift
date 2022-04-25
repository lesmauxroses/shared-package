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
    
    public init(title: String? = nil, message: String? = nil, buttonText: String? = nil, onButtonTapped: (() -> Void)? = nil) {
        self.title = title
        self.message = message
        self.buttonText = buttonText
        self.onButtonTapped = onButtonTapped
    }
    
    public var body: some View {
        ZStack {
            VStack(spacing: 60) {
                Spacer()
                
                Image(packageResource: "illu-eye", ofType: "svg")
                    .resizable()
                    .blendMode(.normal)
                
                VStack(spacing: 40) {
                    if let title = title {
                        Text(title)
                            .foregroundColor(Color.white)
                            .font(.josefinSansLargeTitle)
                    }
                    
                    if let message = message {
                        Text(message)
                            .foregroundColor(Color.white)
                            .font(.josefinSansTitle1)
                            .multilineTextAlignment(.center)
                    }
                    
                    if let buttonText = buttonText {
                        BasicButton(isLoading: .constant(false), type: .secondary, text: buttonText) {
                            if let onButtonTapped = onButtonTapped {
                                onButtonTapped()
                            }
                        }.blendMode(.normal)
                    }
                }
                
                Spacer()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.purple100)
            .blendMode(.lighten)
        //            .background(Image("bg-grain"))
            .ignoresSafeArea()
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(title: "On attend pas Patrick ?", message: "Patrick est très important pour ce projet", buttonText: "Attendre Patrick", onButtonTapped: {
            print("J'attends Patrick")
        })
    }
}
