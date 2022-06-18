//
//  SequenceStep.swift
//  
//
//  Created by Killian Sowa on 18/06/2022.
//

import Foundation

struct SequenceStep {
    let timing: Double
    var action: (() -> Void)? = nil
}
