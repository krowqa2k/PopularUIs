//
//  NetflixDetailsProductView.swift
//  PopularUIs
//
//  Created by Mateusz Krówczyński on 07/08/2024.
//

import SwiftUI

struct NetflixDetailsProductView: View {
    
    var title: String = "Movie Title"
    var isNew: Bool = true
    var yearReleased: String = "2024"
    var seasonCount: Int? = 2
    var hasClosedCaptions: Bool = true
    var isTopTen: Int? = 6
    var descriptionText: String? = "This is the description for the title that is selected an it should go multiple lines."
    var castText: String? = "Cast: Mateusz, Someone, Someone Else"
    var onPlayPressed: (() -> Void)? = nil
    var onDownloadsPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.netflixWhite)
            
            HStack(spacing: 8){
                if isNew {
                    Text("New")
                        .foregroundStyle(.green)
                }
                Text(yearReleased)
                
                if let seasonCount {
                    Text("\(seasonCount) Seasons")
                }
                
                if hasClosedCaptions {
                    Image(systemName: "captions.bubble")
                }
            }
            .foregroundStyle(.netflixLightGray)
            
            if let isTopTen {
                HStack(spacing: 8) {
                    top10Icon
                    
                    Text("#\(isTopTen) in TV Shows Today")
                        .font(.headline)
                        .foregroundStyle(.netflixWhite)
                }
            }
            
            VStack(spacing: 8) {
                Button(action: {
                    onPlayPressed?()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundStyle(.netflixWhite)
                        HStack {
                            Image(systemName: "play.fill")
                                .foregroundStyle(.netflixDarkGray)
                            Text("Play")
                                .foregroundStyle(.netflixDarkGray)
                        }
                    }
                })
                Button(action: {
                    onDownloadsPressed?()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundStyle(.netflixDarkGray)
                        HStack {
                            Image(systemName: "arrow.down.to.line.alt")
                                .foregroundStyle(.netflixWhite)
                            Text("Download")
                                .foregroundStyle(.netflixWhite)
                        }
                    }
                })
            }
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            
            Group {
                if let descriptionText {
                    Text(descriptionText)
                        .foregroundStyle(.netflixWhite)
                }
                
                if let castText {
                    Text(castText)
                        .foregroundStyle(.netflixLightGray)
                }
            }
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
        }
        
    }
    
    private var top10Icon: some View {
            Rectangle()
            .fill(.netflixRed)
            .frame(width: 28, height: 28)
            .overlay {
                VStack(spacing: -4) {
                    Text("TOP")
                        .fontWeight(.bold)
                        .font(.system(size: 8))
                        
                    Text("10")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }
                .offset(y: 1)
                .foregroundStyle(.netflixWhite)
            }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        NetflixDetailsProductView()
    }
}
