//
//  File.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct BasicButton: View {
    @Binding var isLoading: Bool
    @State var isSelected: Bool
    var fillWidth: Bool
    let type: ButtonType
    let text: String
    let onTapped: () -> Void
    
    public init(
        isLoading: Binding<Bool> = .constant(false),
        isSelected: State<Bool>,
        fillWidth: Bool = false,
        type: ButtonType = .primary,
        text: String,
        onTapped: @escaping () -> Void
    ) {
        self._isLoading = isLoading
        self._isSelected = isSelected
        self.fillWidth = fillWidth
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
                        .font(.josefinSans)
                }
            }
        }
        .transition(.scale)
        .transition(.opacity)
        .animation(.easeInOut, value: isLoading)
        .disabled(isLoading)
        .buttonStyle(BasicButtonStyle(
            type: type,
            isSelected: _isSelected)
        )
        .frame(maxWidth: fillWidth ? .infinity : .none)
    }
}

struct BasicButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            HStack {
                BasicButton(
                    isLoading: .constant(false),
                    isSelected: State(initialValue: false),
                    type: .primary,
                    text: "Commencer",
                    onTapped: {}
                )
                
                BasicButton(
                    isLoading: .constant(false),
                    isSelected: State(initialValue: true),
                    type: .primary,
                    text: "Commencer",
                    onTapped: {}
                )
            }
            
            HStack {
                BasicButton(
                    isLoading: .constant(false),
                    isSelected: State(initialValue: false),
                    type: .secondary,
                    text: "Commencer",
                    onTapped: {}
                )
                
                BasicButton(
                    isLoading: .constant(false),
                    isSelected: State(initialValue: true),
                    type: .secondary,
                    text: "Commencer",
                    onTapped: {}
                )
            }
            
        }.padding(50)
            .background(Color.gray)

    }
}

public enum ButtonType {
    case primary, secondary
}
