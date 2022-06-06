//
//  InformationView.swift
//  
//
//  Created by Killian Sowa on 22/04/2022.
//

import SwiftUI

public struct InformationView: View {
    let title: String?
    @State var showButton: Bool
    var onButtonTapped: (() -> Void)?
    
    public init(
        title: String? = nil,
        showButton: State<Bool> = State(initialValue: true),
        onButtonTapped: (() -> Void)? = nil
    ) {
        self.title = title
        self._showButton = showButton
        self.onButtonTapped = onButtonTapped
    }
    
    public var body: some View {
        ZStack {
            VStack(spacing: 60) {
                Spacer()
                
                Image("illu_eye_big_dark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 347)
                
                VStack(spacing: 40) {
                    if let title = title {
                        Text(title)
                            .foregroundColor(Color.dark100)
                            .font(.custom("JosefinSans-Bold", size: 48))
                            .multilineTextAlignment(TextAlignment.center)
                    }
                }
                
                Spacer()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .modifier(NoiseBackground(type: .light))
            .ignoresSafeArea()
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(
            title: "On attend pas Patrick ?",
            onButtonTapped: {
                print("J'attends Patrick")
            }
        )
    }
}
