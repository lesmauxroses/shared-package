//
//  OnboardingMission.swift
//  
//
//  Created by Killian Sowa on 25/04/2022.
//

import SwiftUI

struct OnboardingMission: View {
    var missionNumber: Int? = nil
    let missionText: String
    let timeAvailable: Int
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Image("mission_title")
            }

            VStack {
                Text(missionText)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 30)
                    .font(.josefinInfo)
                    .foregroundColor(Color.dark100)
                    .multilineTextAlignment(TextAlignment.center)
                    .frame(width: 821)
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                
                                .strokeBorder(Color.dark100, lineWidth: 2))
                
                HStack {
                    Text("Vous avez \(timeAvailable) minutes")
                        .padding(20)
                        .background(Color.paleBrown100)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .strokeBorder(Color.MainTheme.getGradientByName(name: "gradientOrangePurple")!, lineWidth: 2)
                                    .rotationEffect(Angle(degrees: 0)))
                        .font(.josefinBody)
                        .foregroundColor(.dark100)
                }.offset(x: -380, y: -5)
                    .rotationEffect(Angle(degrees: 2.5))
                    
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .modifier(NoiseBackground(type: .light))
    }
}

struct OnboardingMission_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingMission(
            missionNumber: 1,
            missionText: "Analysez la présence des femmes dans un film ou une série, à partir du test de Bechdel",
            timeAvailable: 5
        )
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}
