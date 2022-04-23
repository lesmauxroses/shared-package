//
//  SliderItem.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import Foundation

public struct SliderItem: Identifiable {
    public var id: String
    var imageName: String
    var title: String
    
    public init(id: String, imageName: String, title: String) {
        self.id = id
        self.imageName = imageName
        self.title = title
    }
}
