//
//  SliderView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct SliderView: View {
    @StateObject var viewModel = SliderViewModel()
    let onSelectItem: (String) -> Void
    
    let items: [SliderItem]
    
    public init(items: [SliderItem], onSelectItem: @escaping (String) -> Void) {
        self.items = items
        self.onSelectItem = onSelectItem
    }
    
    public var body: some View {
        HStack {
            ForEach(items) { item in
                SliderCard(item: item, isSelected: isSelected(id: item.id)).onTapGesture {
                    withAnimation {
                        onSelectItem(item.id)
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
