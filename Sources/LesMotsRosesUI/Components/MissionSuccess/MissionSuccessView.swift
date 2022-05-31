//
//  MissionSuccessView.swift
//  
//
//  Created by Killian Sowa on 31/05/2022.
//

import SwiftUI

public struct MissionSuccessView: View {
    let qrCodeNumber: Int
    
    public init(
        qrCodeNumber: Int
    ) {
        self.qrCodeNumber = qrCodeNumber
    }
    
    public var body: some View {
        ZStack {
            HStack {
                Image("bgpattern_missionsuccess_left")
                
                Spacer()
                
                VStack {
                    Spacer()
                    
                    Image("bgpattern_missionsuccess_right")
                }
                .frame(maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity)
            
            VStack(spacing: 80) {
                Image("title_missionsuccess")
                
                HStack(spacing: 30) {
                    Image("illu_qrcode\(qrCodeNumber)")
                    
                    Text("Bravo vous avez gagné un morceau de QRCode !")
                        .font(.josefinSansTitle1)
                        .foregroundColor(Color.dark100)
                }.frame(maxWidth: 820)
            }

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .modifier(NoiseBackground(type: .light))
    }
}

struct MissionSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        MissionSuccessView(qrCodeNumber: 1)
            .previewLayout(.fixed(width: 1920, height: 1080))
    }
}
