//
//  ExploreView.swift
//  
//
//  Created by Killian Sowa on 31/05/2022.
//

import SwiftUI

public struct ExploreView: View {
    var percentImage: String?
    var percentText: String?
    var text: String
    var hasQr: Bool
    @State var bouncing: Bool = false
    
    public init(
        percentImage: String? = nil,
        percentText: String? = nil,
        text: String = "les décors autour de vous avant de passer à la suite",
        hasQr: Bool = false
    ) {
        self.percentImage = percentImage
        self.percentText = percentText
        self.text = text
        self.hasQr = hasQr
    }
    
    public var body: some View {
        VStack(spacing: 60) {
            VStack(spacing: 30) {
                Image("title_explore")
                
                Text(text)
                    .foregroundColor(Color.paleBrown100)
                    .font(.custom("JosefinSans-Bold", size: 38))
            }
            
            if hasQr {
                Image("final_qrcode")
                    .offset(y: bouncing ? -15 : 0)
                    .animation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true))
            }
        }
        .onAppear {
            self.bouncing.toggle()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .modifier(NoiseBackgroundWithPattern(theme: .dark, pattern: .explore))
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}
