//
//  OverlayView.swift
//  
//
//  Created by Killian Sowa on 14/06/2022.
//

import SwiftUI

public struct OverlayView: View {
    public init() {}
    
    public var body: some View {
        VStack{}
        .background(Color.dark100.opacity(0.9))
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


