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
            Image(movie.imageName)
            Text(movie.name)
        }.opacity(isSelected ? 1 : 0.4)
    }
}
