//
//  CountdownView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct CountdownView: View {
    @StateObject var viewModel = CountdownViewModel()
    @State var circleScale: CGFloat = 1
    let circleSize: CGFloat = 472
    var onFinished: () -> Void
    
    public init(onFinished: @escaping () -> Void) {
        self.onFinished = onFinished
    }
    
    public var body: some View {
        
        ZStack(alignment: .trailing) {
            Image("bgpattern_countdown")
            
            ZStack(alignment: .center) {
                ZStack {
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
        .modifier(NoiseBackground(type: .dark))
        .ignoresSafeArea()
        .onChange(of: viewModel.remainingTime, perform: { newValue in
            if newValue == 1 {
                withAnimation() {
                    circleScale = 0
                }
            }
        })
        .onAppear {
            viewModel.launchTimer(onFinished: {
                onFinished()
            })
        }
        
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(onFinished: {})
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}

