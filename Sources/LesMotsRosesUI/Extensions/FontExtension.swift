//
//  Font+Custom.swift
//  
//
//  Created by Killian Sowa on 23/04/2022.
//

import Foundation

import SwiftUI

public enum TanDaisy: String, CaseIterable {
    case tanDaisy = "TanDaisy"
}

public enum JosefinSans: String, CaseIterable {
    case medium = "JosefinSans-Medium"
    case semiBold = "JosefinSans-SemiBold"
    case bold = "JosefinSans-Bold"
}

public extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 56
        case .title: return 38
        case .title2: return 32
        case .title3: return 28
        case .headline, .body: return 18
        case .subheadline, .callout: return 16
        case .footnote: return 14
        case .caption, .caption2: return 12
        @unknown default:
            return 8
        }
    }
}

public extension Font {
    private static func custom(_ font: JosefinSans, relativeTo style: Font.TextStyle) -> Font {
        custom(font.rawValue, size: style.size, relativeTo: style)
    }

    static let josefinBody = custom(.medium, relativeTo: .title2)
    static let josefinInfo = custom(.medium, relativeTo: .title)
    static let josefinSans = custom(.medium, relativeTo: .body)
    static let josefinSansLargeTitle = custom(.bold, relativeTo: .largeTitle)
    static let josefinSansTitle1 = custom(.semiBold, relativeTo: .title)
    static let jetBrainsMonoTitle2 = custom(.medium, relativeTo: .title2)
}

public extension Font {
    private static func custom(_ font: TanDaisy, relativeTo style: Font.TextStyle) -> Font {
        custom(font.rawValue, size: style.size, relativeTo: style)
    }

    static let tanDaisy = custom(.tanDaisy, relativeTo: .largeTitle)
}
