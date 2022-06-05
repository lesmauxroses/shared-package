//
//  CircleProgressBarViewModel.swift
//  
//
//  Created by Killian Sowa on 23/05/2022.
//

import Foundation

class CircleProgressBarViewModel: ObservableObject {
    @Published var remainingTime: Double = 0
    var totalTime: Double = 0
    
    func launchTimer(step: Int, totalTime: Double, onFinished: @escaping (_ step: Int) -> Void) {
        self.remainingTime = totalTime
        self.totalTime = totalTime
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (Timer) in
            if self.remainingTime > 0 {
                print ("\(self.remainingTime) seconds")
                self.remainingTime -= 0.2
            } else {
                Timer.invalidate()
                onFinished(step)
            }
        }
    }
}
