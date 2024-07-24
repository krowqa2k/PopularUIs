//
//  PlaylistHeaderCell.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    var height: CGFloat = 300
    var title: String = "Some playlist title goes here"
    var subtitle: String = "Subtitle goes here"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(urlString: imageName)
            }
            .overlay(content: {
                VStack(alignment: .leading, spacing: 8){
                    Spacer()
                    Text(subtitle)
                        .font(.headline)
                        .foregroundStyle(Color.spotifyLightGray)
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.spotifyWhite)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)
                )
            })
            .asStretchyHeader(startingHeight: height)
            
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
    
}
