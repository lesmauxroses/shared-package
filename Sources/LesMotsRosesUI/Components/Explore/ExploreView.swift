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
                
                
                VStack {
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
                            .padding(.top, 70)
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
            
            ZStack {
                Text("Vous pouvez récupérer votre badge !")
                    .foregroundColor(Color.paleBrown100)
                    .font(.josefinBody)
                    .frame(width: 400)
                    .padding(35)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.paleBrown100, lineWidth: 2)
                    )
                    .rotationEffect(.degrees(-8))
                
                Image("explore-eye")
                    .rotationEffect(.degrees(-8))
                    .offset(x: 200, y: 20)
                
                
            }.offset(x: -650, y: -250)
            
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
