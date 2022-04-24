//
//  SliderCard.swift
//  
//
//  Created by Killian Sowa on 23/04/2022.
//

import SwiftUI

struct SliderCard: View {
    let item: SliderItem
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Image(item.imageName)
                .resizable()
                .frame(width: isSelected ? 322 : 281, height: isSelected ? 403 : 352)
            
            Text(item.title)
                .font(.josefinSans)
        }.opacity(isSelected ? 1 : 0.4)
    }
}
