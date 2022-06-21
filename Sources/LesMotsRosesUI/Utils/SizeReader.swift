//
//  SizeReader.swift
//  
//
//  Created by Killian Sowa on 21/06/2022.
//

import Foundation
import SwiftUI

public struct Sizes: PreferenceKey {
    public typealias Value = [CGRect]
    public static var defaultValue: [CGRect] = []

    public static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}

public struct SizeReader: View {
    public var body: some View {
        GeometryReader { proxy in
            Color.clear
            .preference(key: Sizes.self, value: [proxy.frame(in: .global)])
        }
    }
}
