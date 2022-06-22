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
    
    public init(
        percentImage: String? = nil,
        percentText: String? = nil
    ) {
        self.percentImage = percentImage
        self.percentText = percentText
    }
    
    public var body: some View {
        ZStack {
            VStack(spacing: 200) {
                
                
                VStack(spacing: 30) {
                    Image("title_explore")
                    
                    Text("les décors autour de vous avant de passer à la suite")
                        .foregroundColor(Color.paleBrown100)
                        .font(.custom("JosefinSans-Bold", size: 38))
                }
                
                if(percentImage != nil && self.percentText != nil) {
                    
                    ZStack {
                        Text(self.percentText!)
                            .foregroundColor(Color.paleBrown100)
                            .font(.josefinBody)
                            .frame(width: 500)
                            .padding(40)
                            .padding(.top, 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.paleBrown100, lineWidth: 2)
                                    .rotationEffect(.degrees(-2))
                            )
                        
                        Image(self.percentImage!)
                            .offset(y: -130)
                    }
                }
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .modifier(NoiseBackgroundWithPattern(theme: .dark, pattern: .explore))
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}
