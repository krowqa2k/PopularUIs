//
//  SpotifyPlaylistDescriptionCell.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import SwiftUI

struct SpotifyPlaylistDescriptionCell: View {
    
    var descriptionText: String = Product.mock.description
    var userName: String = "Mateusz"
    var subheadline: String = "Some headline goes here"
    var addToPlaylist: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(descriptionText)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            madeForYouSection
            
            Text(subheadline)
            
            buttonsRow
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(Color.spotifyLightGray)
    }
    
    private var madeForYouSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(Color.spotifyGreen)
            
            Text("Made for ")
            +                      // text concatenation
            Text(userName)
                .bold()
                .foregroundStyle(Color.spotifyWhite)
        }
    }
    
    private var buttonsRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0){
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0.001))
                    .onTapGesture {
                        
                    }
                    
            }
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .offset(x: -8)
            
            HStack(spacing: 0) {
                Image(systemName: "shuffle")
                    .font(.title2)
                    .foregroundStyle(Color.spotifyGreen)
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .foregroundStyle(Color.spotifyGreen)
                    .padding(8)
                    .background(Color.spotifyBlack.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .offset(x: 8)
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyPlaylistDescriptionCell()
            .padding()
    }
    
}
