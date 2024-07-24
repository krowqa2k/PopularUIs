//
//  ImageTitleRowCell.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var imageSize: CGFloat = 100
    var title: String = "Some title"
    var imageName: String = Constants.randomImage
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.caption)
                .foregroundStyle(.spotifyWhite)
                .padding(4)
                .lineLimit(2)
        }
        .frame(width: imageSize, height: 150)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        ImageTitleRowCell()
    }
    
}
