//
//  InterestPillView.swift
//  PopularUIs
//
//  Created by admin on 28/07/2024.
//

import SwiftUI

struct InterestPillView: View {
    
    var iconName: String? = "heart.fill"
    var emoji: String? = "🤙"
    var text: String = "Graduate Degree"
    
    var body: some View {
        HStack(spacing: 4) {
            if let iconName {
                Image(systemName: iconName)
            } else if let emoji {
                Text(emoji)
            }
            
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleLightYellow)
        .cornerRadius(32)
    }
}

#Preview {
    VStack {
        InterestPillView(iconName: nil)
        InterestPillView()
    }
    
}
