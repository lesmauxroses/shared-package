//
//  NumberView.swift
//  
//
//  Created by Killian Sowa on 05/06/2022.
//

import SwiftUI

public struct NumberView: View {
    let number: Int
    var isSuccess: Bool = true
    let type: NumberType
    
    public var circleSize: CGFloat {
        switch type {
        case .little:
            return 472
        case .medium:
            return 134
        case .big:
            return 80
        }
    }
    
    public init(
        number: Int,
        isSuccess: Bool,
        type: NumberType
    ) {
        self.number = number
        self.isSuccess = isSuccess
        self.type = type
    }
    
    public var body: some View {
        ZStack {
            ZStack {
                Image("ic_\(number)_\(type.rawValue)")
            }
            .frame(width: circleSize, height: circleSize)
            .background(isSuccess ? Color.purple100 : Color.orange100)
            .clipShape(Circle())
        }
    }
}

public enum NumberType: String {
    case little, medium, big
}
