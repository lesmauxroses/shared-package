//
//  TutorialView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct TutorialView: View {
    let steps: [OnboardingStep]
    
    public init(steps: [OnboardingStep]) {
        self.steps = steps
    }
    
    public var body: some View {
        HStack(spacing: 20) {
            ForEach(Array(steps.enumerated()), id: \.element) { index, element in
                VStack(spacing: 30) {
                    Text("\(index)")
                        .foregroundColor(Color.dark100)
                        .frame(width: 60, height: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.purple100, lineWidth: 2)
                        )
                    
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

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView(steps: [
            OnboardingStep(
                id: "drag",
                description: "Place les stickers sur les mots que tu trouves sexistes.",
                imageName: ""
            ),
            OnboardingStep(
                id: "remove",
                description: "Si tu veux retirer un sticker, appuie sur celui-ci pour le supprimer.",
                imageName: ""
            ),
            OnboardingStep(
                id: "drag",
                description: "Les stickers ajoutés par les autres joueurs seront visibles sur l’écran en face de toi à la fin de l’interaction.",
                imageName: ""
            )
        ]).background(Color.paleBrown100)
    }
}
