//
//  File.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct BasicButton: View {
    @Binding var isLoading: Bool
    var text: String
    var onTapped: () -> Void
    
    public init(isLoading: Binding<Bool>, text: String, onTapped: @escaping () -> Void) {
        self._isLoading = isLoading
        self.text = text
        self.onTapped = onTapped
    }
    
    public var body: some View {
        Button(action: {
            onTapped()
        }) {
            HStack {
                if isLoading{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                        .frame(height: 64)
                } else {
                    Text(text)
                }
            }
        }
        .transition(.scale)
        .transition(.opacity)
        .animation(.easeInOut, value: isLoading)
        .disabled(isLoading)
        .buttonStyle(BasicButtonStyle())
    }
}

struct BasicButton_Previews: PreviewProvider {
    static var previews: some View {
        BasicButton(isLoading: .constant(false), text: "Commencer", onTapped: {})
    }
}
