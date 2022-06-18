//
//  CaptionView.swift
//  
//
//  Created by Killian Sowa on 18/06/2022.
//

import SwiftUI

public struct CaptionView: View {
    @State var currentStep: Int = 0
    let captions: [Caption]
    var delay: CGFloat = 0
    
    public init(
        captions: [Caption],
        delay: CGFloat = 0
    ) {
        self.captions = captions
        self.delay = delay
    }
    
    public var body: some View {
        VStack {
            Text(captions[currentStep].text)
                .foregroundColor(Color.dark100)
                .font(.josefinInfo)
                .transition(.opacity)
                .id(UUID().uuidString)
            
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                launchSteps(sequenceSteps: captions)
            }
        }

    }
    
    func launchSteps(sequenceSteps: [Caption]) {
        let numberOfSteps = sequenceSteps.count-1

        func nextStep() {
            if currentStep < numberOfSteps {
                DispatchQueue.main.asyncAfter(deadline: .now() + sequenceSteps[currentStep].time) {
                    self.currentStep += 1

                    nextStep()
                }
            }
        }

        nextStep()
    }
}

struct CaptionViewView_Previews: PreviewProvider {
    static var previews: some View {
        CaptionView(captions: [
            Caption(text: "Weshhh, petit test de sous-titre", time: 0),
            Caption(text: "Weshhh, vfzefzefzfzs-titre", time: 4),
            Caption(text: "cdlsnvdkzjvbfjzzs-titre", time: 8),
            Caption(text: "Woroogferloloozs-titre", time: 12),
        ])
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.paleBrown100)
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}

