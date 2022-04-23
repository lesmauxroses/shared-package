//
//  SliderView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

struct SliderView: View {
    @StateObject var viewModel = SliderViewModel()
    
    let items: [SliderItem]
    
    public init(items: [SliderItem]) {
        self.items = items
    }
    
    var body: some View {
        HStack {
            ForEach(items) { item in
                SliderCard(item: item, isSelected: isSelected(id: item.id)).onTapGesture {
                    withAnimation {
                        viewModel.state.selectedItem = item.id
                    }
                }
            }
        }
    }
    
    func isSelected(id: String) -> Bool {
        return viewModel.state.selectedItem == id
    }
}
