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
      let timeFormatted = formatter.string(from: self) ?? ""
      
      if self < 60 {
          if self < 10 {
              return "00:0\(timeFormatted)"
          } else {
              return "00:\(timeFormatted)"
          }
      } else {
          return "0\(timeFormatted)"
      }
  }
}
