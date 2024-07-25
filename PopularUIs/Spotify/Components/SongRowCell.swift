//
//  SongRowCell.swift
//  PopularUIs
//
//  Created by admin on 25/07/2024.
//

import SwiftUI

struct SongRowCell: View {
    
    var imageName: String = Constants.randomImage
    var imageSize: CGFloat = 50
    var songName: String = "Example song"
    var subtitle: String = "Subtitle"
    var onEllipsisPressed: (() -> Void)? = nil
    var onCellPressed: (() -> Void)? = nil
    
    var body: some View {
        HStack {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            VStack(alignment: .leading) {
                Text(songName)
                    .font(.body)
                    .foregroundStyle(Color.spotifyWhite)
                    .fontWeight(.medium)
                    .lineLimit(2)
                
                Text(subtitle)
                    .font(.callout)
                    .foregroundStyle(Color.spotifyLightGray)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .foregroundStyle(Color.spotifyWhite)
                .padding()
                .offset(x: 16)
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .padding(.horizontal)
        .onTapGesture {
            onCellPressed?()
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
    
}
