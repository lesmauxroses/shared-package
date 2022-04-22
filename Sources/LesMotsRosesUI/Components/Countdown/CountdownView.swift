//
//  CountdownView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

struct CountdownView: View {
    @StateObject var viewModel = CountdownViewModel()
    
    var body: some View {
        Text(viewModel.remainingTime)
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}

