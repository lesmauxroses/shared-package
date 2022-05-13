//
//  CountdownView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct CountdownView: View {
    @StateObject var viewModel = CountdownViewModel()
    
    public var body: some View {
        let size: CGFloat = 472
        
        VStack {
            ZStack {
                ZStack {
                    Text("\(viewModel.remainingTime)")
                }
                .clipShape(Circle())
                .frame(width: size, height: size)
            }
        }
        #if os(iOS)
            .navigationBarHidden(true)
        #endif
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(NoiseBackground(type: .dark))
        .ignoresSafeArea()
        .onAppear {
            viewModel.launchTimer()
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}

