//
//  LineProgressBar.swift
//  
//
//  Created by Killian Sowa on 03/06/2022.
//

import SwiftUI

struct LineProgressBarView: View {
    @StateObject var viewModel = LineProgressBarViewModel()
    
    let totalTime: Double
    let width: CGFloat
    let onFinished: (_ step: Int) -> Void
    let height: CGFloat = 60
    
    public init(
        totalTime: Double,
        width: CGFloat,
        onFinished: @escaping (_ step: Int) -> Void
        
    ) {
        self.totalTime = totalTime
        self.width = width
        self.onFinished = onFinished
    }
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                HStack {}
                .frame(width: width - 100, height: height)
                .background(Color.MainTheme.getGradientByName(name: "gradientPurpleOrange")!)
            }
            .frame(width: width, height: height)
            .background(Color.paleBrown100)
            .cornerRadius(18)
            
            Text("")
        }

    }
}

struct LineProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        LineProgressBarView(
            totalTime: 20,
            width: 734,
            onFinished: { step in
                
            }
        )
    }
}


