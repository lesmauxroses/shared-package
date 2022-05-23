//
//  ProgressBar.swift
//  
//
//  Created by Killian Sowa on 23/05/2022.
//

import SwiftUI

public struct ProgressBar: View {
    @StateObject var viewModel = ProgressBarViewModel()
    
    @State var step: Int
    var totalTime: Double = 0
    let onFinished: (_ step: Int) -> Void
    
    public init(
        step: State<Int>,
        totalTime: Double,
        onFinished: @escaping (_ step: Int) -> Void
    ) {
        self._step = step
        self.totalTime = totalTime
        self.onFinished = onFinished
    }
    
    public var body: some View {
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
        .onChange(of: step, perform: { newValue in
            viewModel.launchTimer(
                step: step,
                totalTime: totalTime,
                onFinished: { step in
                    onFinished(step)
                }
            )
        })
        .frame(width: 90, height: 90)
        .padding(6)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    @State var step: Int
    
    static var previews: some View {
        ProgressBar(
            step: State(initialValue: 0),
            totalTime: 20,
            onFinished: { step in
                print(step)
            }
        )
    }
}

