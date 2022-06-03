//
//  Colors.swift
//  
//
//  Created by Killian Sowa on 23/04/2022.
//

import SwiftUI

public extension Color {
    static var dark100: Color { Color(#function, bundle: Bundle.module) }
    static var orange100: Color { Color(#function, bundle: Bundle.module) }
    static var paleBrown100: Color { Color(#function, bundle: Bundle.module) }
    static var purple100: Color { Color(#function, bundle: Bundle.module) }
}

public extension Color {
    struct MainTheme {
        public static var gradients = [
            "gradientOrangePurple": LinearGradient(
                gradient: Gradient(colors: [Color.orange100, Color.purple100]),
                startPoint: .topLeading,
                endPoint: .topTrailing
            ),
            "gradientPurpleOrange": LinearGradient(
                gradient: Gradient(colors: [Color.purple100, Color.orange100]),
                startPoint: .topLeading,
                endPoint: .topTrailing
            )
        ]
        
        public static func getGradientByName(name: String) -> LinearGradient? {
            return self.gradients[name]
        }
    }
}
