//
//  File.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct BasicButton: View {
    @Binding var isLoading: Bool
    let type: ButtonType
    let text: String
    let onTapped: () -> Void
    
    public init(
        isLoading: Binding<Bool>,
        type: ButtonType = .primary,
        text: String,
        onTapped: @escaping () -> Void
    ) {
        self._isLoading = isLoading
        self.type = type
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
        .shadow(color: type == .primary ? Color.orange100 : Color.dark100, radius: 0, x: 4, y: 4)
        .buttonStyle(BasicButtonStyle(type: type))
    }
}

struct BasicButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            BasicButton(isLoading: .constant(false), type: .primary, text: "Commencer", onTapped: {})
            
            BasicButton(isLoading: .constant(false), type: .secondary, text: "Commencer", onTapped: {})
        }.padding(50)
            .background(Color.gray)

    }
}

public enum ButtonType {
    case primary, secondary
}
