//
//  SliderCard.swift
//  
//
//  Created by Killian Sowa on 23/04/2022.
//

import SwiftUI

struct SliderCard: View {
    var item: SliderItem
    var isSelected: Bool
    
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaleEffect(isSelected ? 1 : 0.8)
                .frame(width: 350, height: 437)
            Text(item.title)
        }.opacity(isSelected ? 1 : 0.4)
    }
}
