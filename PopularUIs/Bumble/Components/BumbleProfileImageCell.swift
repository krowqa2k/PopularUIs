//
//  BumbleProfileImageCell.swift
//  PopularUIs
//
//  Created by admin on 29/07/2024.
//

import SwiftUI

struct BumbleProfileImageCell: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    
    var body: some View {
        ZStack{
            ImageLoaderView(urlString: imageName)
                .clipShape(Circle())
                .padding(5)
            
            Circle()
                .stroke(.bumbleGray, lineWidth: 2)
            
            Circle()
                .trim(from: 0, to: percentageRemaining)
                .stroke(.bumbleYellow, lineWidth: 4)
                .rotationEffect(Angle(degrees: -90))
                .scaleEffect(x: -1, y: 1, anchor: .center)
        }
        .frame(width: 75, height: 75)
        .overlay (
            ZStack {
                if hasNewMessage {
                    Circle()
                        .fill(Color.bumbleWhite)
                    Circle()
                        .fill(Color.bumbleYellow)
                        .padding(4)
                }
            }
            .frame(width: 24, height: 24)
            .offset(x: 2, y: 2)
            , alignment: .bottomTrailing
        )
    }
}

#Preview {
    HStack{
        BumbleProfileImageCell()
        BumbleProfileImageCell()
        BumbleProfileImageCell()
        BumbleProfileImageCell()
    }
    
}
