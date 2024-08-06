//
//  NetflixHeroCell.swift
//  PopularUIs
//
//  Created by Mateusz Krówczyński on 06/08/2024.
//

import SwiftUI

struct NetflixHeroCell: View {
    
    var imageName: String = Constants.randomImage
    var isNetflixFilm: Bool = true
    var title: String = "Players"
    var categories: [String] = ["Raunchy", "Romantic", "Comedy"]
    var onBackgroundPresed: (() -> Void)? = nil
    var onMyListPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            ImageLoaderView(urlString: imageName)
                .cornerRadius(12)
                .aspectRatio(0.8, contentMode: .fit)
            
            VStack(spacing: 16) {
                VStack() {
                    Spacer()
                    HStack {
                        Text("N")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.netflixRed)
                        
                        Text("FILM")
                            .font(.headline)
                            .foregroundStyle(Color.netflixLightGray)
                    }
                    .opacity(isNetflixFilm ? 1 : 0)
                    
                    Text(title)
                        .font(.system(size: 50, weight: .medium, design: .serif))
                        .fontWeight(.regular)
                        .foregroundStyle(Color.netflixWhite)
                    
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .font(.callout)
                            
                            if category != categories.last {
                                Circle()
                                    .frame(width: 4, height: 4)
                            }
                        }
                        .padding(.bottom, 16)
                    }
                    .foregroundStyle(Color.netflixWhite)
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            onPlayPressed?()
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 140, height: 40)
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
                            onMyListPressed?()
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 140, height: 40)
                                    .foregroundStyle(.netflixDarkGray)
                                HStack {
                                    Image(systemName: "plus")
                                        .foregroundStyle(.netflixWhite)
                                    Text("My List")
                                        .foregroundStyle(.netflixWhite)
                                }
                            }
                        })
                    }
                }
                .padding(.bottom, 24)
            }
            .frame(width: 350, height: 420)
        }
        .asButton(.tap) {
            onBackgroundPresed?()
        }
    }
}

#Preview {
    NetflixHeroCell()
        .padding(40)
}
