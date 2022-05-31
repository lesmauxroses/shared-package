//
//  ExploreView.swift
//  
//
//  Created by Killian Sowa on 31/05/2022.
//

import SwiftUI

public struct ExploreView: View {
    public init(
    ) {}
    
    public var body: some View {
        VStack(spacing: 50) {
            VStack {
                Image("title_explore")
                
                Text("les décors autour de vous avant de passer à la suite")
                    .foregroundColor(Color.paleBrown100)
                    .font(.custom("JosefinSans-Bold", size: 38))
            }
            
            VStack(spacing: 20) {
                Text("02 : 59")
                    .font(.custom("JosefinSans-Medium", size: 88))
                    .foregroundColor(Color.paleBrown100)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 68)
                    .overlay(RoundedRectangle(cornerRadius: 44)
                                .strokeBorder(Color.purple100, lineWidth: 5))
                
                HStack {
                    Text("Attention au chrono !")
                        .font(.custom("JosefinSans-SemiBold", size: 32))
                        .foregroundColor(Color.paleBrown100)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(NoiseBackground(type: .dark))
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}
