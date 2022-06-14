//
//  CountdownView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct CountdownView: View {
    @StateObject var viewModel = CountdownViewModel()
    let circleSize: CGFloat = 472
    var screenType: ScreenType
    var onFinished: () -> Void
    
    public init(screenType: ScreenType = .ipad, onFinished: @escaping () -> Void) {
        self.screenType = screenType
        self.onFinished = onFinished
    }
    
    public var body: some View {
        
        ZStack(alignment: .trailing) {
            Image("bgpattern_countdown")
            
            ZStack(alignment: .center) {
                VStack {
                    switch viewModel.remainingTime {
                    case 3:
                        NumberView(
                            number: 3,
                            type: .big
                        )
                    case 2:
                        NumberView(
                            number: 2,
                            type: .big
                        )
                    default:
                        NumberView(
                            number: 1,
                            type: .big
                        )
                    }
                }.animation(.easeInOut(duration: 1), value: viewModel.remainingTime)
                    .transition(.opacity)

            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        #if os(iOS)
        .navigationBarHidden(true)
        #endif
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(NoiseBackgroundWithPattern(theme: .dark, pattern: .controlDark))
        .ignoresSafeArea()
        .onAppear {
            viewModel.launchTimer(onFinished: {
                onFinished()
            })
        }
        
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(screenType: .screen, onFinished: {})
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}

