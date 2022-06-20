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
    var withBorder: Bool = false
    
    public init(
        totalTime: CGFloat,
        currentTime: CGFloat,
        width: CGFloat,
        showTimeText: Bool = true,
        withBorder: Bool = false
    ) {
        self.totalTime = totalTime
        self.currentTime = currentTime
        self.width = width
        self.showTimeText = showTimeText
        self.withBorder = withBorder
    }
    
    public var body: some View {
        let remainingTime = totalTime - currentTime
        let progressionWidth = currentTime/totalTime*width
        
        HStack(spacing: 30) {
            HStack {
                VStack {
                    VStack{}
                    .frame(width: progressionWidth, height: height)
                    .background(Color.MainTheme.getGradientByName(name: "gradientPurpleOrange")!)
                }.transition(.scale)
                    .animation(.easeInOut, value: progressionWidth)
                
                Spacer(minLength: 0)
            }
            .frame(width: width, height: height)
            .background(Color.paleBrown100)
            .cornerRadius(18)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color.dark100, lineWidth: withBorder ? 2 : 0)
            )
            
            if showTimeText {
                Text("\(remainingTime.asMinutesSeconds(style: .positional))")
                    .font(.custom("JosefinSans-Bold", size: 50))
                    .foregroundColor(Color.paleBrown100)
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(width: 132)
            }
        }

    }
}

struct LineProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        LineProgressBarView(
            totalTime: 200,
            currentTime: 100,
            width: 734,
            withBorder: true
        )

    }
}


