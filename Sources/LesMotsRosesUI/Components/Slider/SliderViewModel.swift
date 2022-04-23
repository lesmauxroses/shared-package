//
//  SliderViewModel.swift
//  
//
//  Created by Killian Sowa on 23/04/2022.
//

import Foundation

class SliderViewModel: ObservableObject {
    @Published var state = State()
    
    struct State {
        var selectedItem: String = ""
    }
}

