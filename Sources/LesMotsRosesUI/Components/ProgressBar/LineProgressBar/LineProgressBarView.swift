//
//  LineProgressBar.swift
//  
//
//  Created by Killian Sowa on 03/06/2022.
//

import SwiftUI

public struct LineProgressBarView: View {
    let totalTime: Double
    var currentTime: Double
    let width: CGFloat
    let height: CGFloat = 60
    var showTimeText: Bool = true
    
    public init(
        totalTime: CGFloat,
        currentTime: CGFloat,
        width: CGFloat,
        showTimeText: Bool = true
    ) {
        self.totalTime = totalTime
        self.currentTime = currentTime
        self.width = width
        self.showTimeText = showTimeText
    }
    
    public var body: some View {
        let remainingTime = totalTime - currentTime
        let progressionWidth = currentTime/totalTime*width
        
        HStack(spacing: 30) {
            HStack {
                VStack {}
                .frame(width: progressionWidth, height: height)
                .transition(.scale)
                .animation(.easeInOut, value: progressionWidth)
                .background(Color.MainTheme.getGradientByName(name: "gradientPurpleOrange")!)
                
                Spacer(minLength: 0)
            }
            .frame(width: width, height: height)
            .background(Color.paleBrown100)
            .cornerRadius(18)
            
            if showTimeText {
                Text("\(remainingTime.asMinutesSeconds(style: .positional))")
                    .font(.custom("JosefinSans-Bold", size: 50))
                    .foregroundColor(Color.paleBrown100)
                    .fixedSize(horizontal: true, vertical: false)
            }
        }

    }
}

struct LineProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        LineProgressBarView(
            totalTime: 20,
            currentTime: 12,
            width: 734
        )
    }
}


