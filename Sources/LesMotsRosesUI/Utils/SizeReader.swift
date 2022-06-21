//
//  SizeReader.swift
//  
//
//  Created by Killian Sowa on 21/06/2022.
//

import Foundation

struct Sizes: PreferenceKey {
    typealias Value = [CGRect]
    static var defaultValue: [CGRect] = []

    static func reduce(value: inout [CGRect], nextValue: () -> [CGRect]) {
        value.append(contentsOf: nextValue())
    }
}

struct SizeReader: View {
    var body: some View {
        GeometryReader { proxy in
            Color.clear
            .preference(key: Sizes.self, value: [proxy.frame(in: .global)])
        }
    }
}
