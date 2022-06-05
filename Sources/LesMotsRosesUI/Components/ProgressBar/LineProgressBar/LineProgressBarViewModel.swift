//
//  LineProgressBarViewModel.swift
//  
//
//  Created by Killian Sowa on 03/06/2022.
//

import Foundation

class LineProgressBarViewModel: ObservableObject {
    @Published var remainingTime: Double = 0
    var totalTime: Double = 0
    
    func launchTimer(totalTime: Double, onFinished: @escaping (
    ) -> Void) {
        self.remainingTime = totalTime
        self.totalTime = totalTime
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (Timer) in
            if self.remainingTime > 0 {
                self.remainingTime -= 0.2
            } else {
                Timer.invalidate()
                onFinished()
            }
        }
    }
}
