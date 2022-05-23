//
//  ProgressBar.swift
//  
//
//  Created by Killian Sowa on 23/05/2022.
//

import SwiftUI

public struct ProgressBar: View {
    @StateObject var viewModel = ProgressBarViewModel()
    var totalTime: Double = 0
    
    public init(
        totalTime: Double
    ) {
        self.totalTime  = totalTime
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 6.0)
                .opacity(0.3)
                .foregroundColor(Color.dark100.opacity(0.6))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(viewModel.remainingTime/totalTime, 1.0)))
                .stroke(Color.MainTheme.getGradientByName(name: "gradientOrangePurple")!, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)

            Text((viewModel.remainingTime).asMinutesSeconds(style: .positional))
                .font(.custom(JosefinSans.medium.rawValue, size: 24))
                .foregroundColor(Color.paleBrown100)
        }

        .frame(width: 90, height: 90)
        .padding(6)
        .onAppear {
            viewModel.launchTimer(totalTime: totalTime, onFinished: {})
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(totalTime: 20)
    }
}

