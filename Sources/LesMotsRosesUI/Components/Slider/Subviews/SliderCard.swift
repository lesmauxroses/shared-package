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
            Text(item.title)
        }.opacity(isSelected ? 1 : 0.4)
    }
}
