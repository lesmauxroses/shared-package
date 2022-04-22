//
//  File.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

struct BasicButton: View {
    var text: String
    var onTapped: () -> Void
    
    var body: some View {
        Button {
            onTapped()
        } label: {
            Text(text)
        }

    }
    
}
