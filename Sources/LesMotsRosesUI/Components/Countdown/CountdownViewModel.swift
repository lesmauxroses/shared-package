//
//  CountdownViewModel.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

class CountdownViewModel: ObservableObject {
    @Published var remainingTime: Int = 3
    
    func launchTimer(onFinished: @escaping () -> Void) {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.remainingTime > 0 {
                print ("\(self.remainingTime) seconds")
                self.remainingTime -= 1
            } else {
                Timer.invalidate()
                onFinished()
            }
        }
    }
}
