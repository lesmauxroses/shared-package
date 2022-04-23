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
        VStack {
            Image(item.imageName)
                .resizable()
                .frame(width: isSelected ? 329 : 274, height: isSelected ? 274 : 342)
            Text(item.title)
        }.opacity(isSelected ? 1 : 0.4)
    }
}
