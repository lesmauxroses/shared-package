//
//  TutorialView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct TutorialView: View {
    let steps: [TutorialStep]
    let screenType: ScreenType
    
    public init(steps: [TutorialStep], screenType: ScreenType) {
        self.steps = steps
        self.screenType = screenType
    }
    
    public var body: some View {
        let horizontalSpacing: CGFloat = screenType == .ipad ? 20 : 104
        let numbersSize: CGFloat = screenType == .ipad ? 60 : 104
        
        VStack(spacing: 50) {
            Image("tutorial_title")
            
            HStack(
                spacing: horizontalSpacing
            ) {
                ForEach(Array(steps.enumerated()), id: \.element) { index, element in
                    VStack(spacing: 30) {
                        Text("\(index)")
                            .foregroundColor(Color.dark100)
                            .frame(width: numbersSize, height: numbersSize)
                            .background(Color.purple100)
                            .clipShape(Circle())
                        
                        Image(element.imageName)
                        
                        Text(element.description)
                            .foregroundColor(Color.dark100)
                            .font(.josefinSans)
                            .padding(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.dark100, lineWidth: 2)
                            )
                    }
                }
            }
        }

    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(
            steps: [
                TutorialStep(
                    id: "drag",
                    description: "Place les stickers sur les mots que tu trouves sexistes.",
                    imageName: ""
                ),
                TutorialStep(
                    id: "remove",
                    description: "Si tu veux retirer un sticker, appuie sur celui-ci pour le supprimer.",
                    imageName: ""
                ),
                TutorialStep(
                    id: "drag",
                    description: "Les stickers ajoutés par les autres joueurs seront visibles sur l’écran en face de toi à la fin de l’interaction.",
                    imageName: ""
                )
            ],
            screenType: .screen
        ).background(Color.paleBrown100)
    }
}
