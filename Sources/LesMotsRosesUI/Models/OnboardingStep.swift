//
//  TutorialStep.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct TutorialStep: Identifiable, Hashable {
    public let id: String
    let description: String
    let imageName: String
    
    public init(id: String, description: String, imageName: String) {
        self.id = id
        self.description = description
        self.imageName = imageName
    }
}
