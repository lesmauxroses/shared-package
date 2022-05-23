//
//  CountdownView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct CountdownView: View {
    @StateObject var viewModel = CountdownViewModel()
    var onFinished: () -> Void
    
    public init(onFinished: @escaping () -> Void) {
        self.onFinished = onFinished
    }
    
    public var body: some View {
        let size: CGFloat = 472
        
        ZStack(alignnment: .trailing) {
            Image("bgpattern_countdown")
            
            ZStack(alignment: .center) {
                ZStack {
                    ZStack {
                        //Text("\(viewModel.remainingTime)")
                        Text("E")
                            .foregroundColor(Color.white)
                            .font(.custom(TanDaisy.bold.rawValue, size: 300))
                    }
                    .frame(width: size, height: size)
                    .background(Color.purple100)
                    .clipShape(Circle())
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        #if os(iOS)
        .navigationBarHidden(true)
        #endif
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(NoiseBackground(type: .dark))
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
        CountdownView(onFinished: {})
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}

