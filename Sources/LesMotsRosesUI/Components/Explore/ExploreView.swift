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
        VStack {
            Image("title_explore")
            
            Text("les décos autour de vous avant de passer à la suite")
                .foregroundColor(Color.paleBrown100)
            
            VStack {
                HStack {
                    Text("Attention au chrono !")
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
