//
//  File.swift
//  
//
//  Created by Killian Sowa on 23/05/2022.
//

import Foundation

extension Double {
  func asMinutesSeconds(style: DateComponentsFormatter.UnitsStyle) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.minute, .second]
    formatter.unitsStyle = style
    return formatter.string(from: self) ?? ""
  }
}
