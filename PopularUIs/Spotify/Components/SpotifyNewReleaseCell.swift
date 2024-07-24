//
//  SpotifyNewReleaseCell.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New release from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single-title"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .foregroundStyle(.spotifyWhite)
                                .fontWeight(.semibold)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyGray)
                                .lineLimit(2)
                        }
                    }
                    .font(.callout)
                    HStack() {
                        Image(systemName: "plus.circle")
                            .font(.title3)
                            .padding(4)
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
    
                        Image(systemName: "play.circle.fill")
                            .font(.title)
                    }
                    .padding(.bottom, 4)
                    .foregroundStyle(.spotifyLightGray)
                    
                }
                .padding(.trailing)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()
    }
}
