//
//  SpotifyCategoryCell.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = "All"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .cornerRadius(16)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        VStack(spacing: 40) {
            SpotifyCategoryCell(title: "Title goes here")
            SpotifyCategoryCell(title: "Title goes here", isSelected: true)
            SpotifyCategoryCell(isSelected: true)
        }
    }
}
