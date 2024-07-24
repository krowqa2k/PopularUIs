//
//  SpotifyRecentsCell.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some random title"
    var isSelected: Bool = false
    
    var body: some View {
        HStack(spacing: 16){
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: isSelected)
        .cornerRadius(6)
    }
}

extension View {
    
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
    }
    
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack {
            HStack {
                SpotifyRecentsCell(isSelected: false)
                SpotifyRecentsCell(isSelected: true)
            }
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
}
