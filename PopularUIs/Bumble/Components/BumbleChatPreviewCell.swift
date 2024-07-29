//
//  BumbleChatPreviewCell.swift
//  PopularUIs
//
//  Created by admin on 29/07/2024.
//

import SwiftUI

struct BumbleChatPreviewCell: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    var userName: String = "Mateusz"
    var lastChatMessage: String? = "This is the last message."
    var isYourMove: Bool = true
    
    var body: some View {
        HStack(spacing: 8) {
            BumbleProfileImageCell(imageName: imageName, percentageRemaining: percentageRemaining, hasNewMessage: hasNewMessage)
                .padding(.horizontal, 6)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(userName)
                        .font(.title3)
                        .foregroundStyle(.bumbleBlack)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if isYourMove {
                        Text("YOUR MOVE")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .frame(width: 75)
                            .padding(4)
                            .padding(.horizontal, 2)
                            .background(Color.bumbleYellow)
                            .cornerRadius(12)
                    }
                }
                
                Text(lastChatMessage ?? "")
                    .font(.subheadline)
                    .foregroundStyle(Color.bumbleGray)
            }
            .lineLimit(1)
        }
        .background(Color.bumbleWhite)
    }
}

#Preview {
    BumbleChatPreviewCell()
}
