//
//  SpotifyPlaylistView.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    
    @Environment(\.router) var router
    var product: Product = .mock
    var user: User = .mock
    
    @State private var products: [Product] = []
    @State private var showHeader: Bool = true
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12){
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand ?? "",
                        imageName: product.thumbnail
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                    
                    SpotifyPlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category
                    )
                    .padding(.horizontal, 16)
                    
                    ForEach(products){ product in
                        SongRowCell(
                            imageName: product.firstImage,
                            imageSize: 50,
                            songName: product.title,
                            subtitle: product.brand ?? "") {
                                goToPlaylistView(product: product)
                            }
                            
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            ZStack {
                Text(product.title)
                    .font(.headline)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(Color.spotifyBlack)
                    .offset(y: showHeader ? 0 : -200)
                    .opacity(showHeader ? 1 : 0)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(showHeader ? Color.black.opacity(0.001) : Color.spotifyGray.opacity(0.7))
                    .clipShape(Circle())
                    .onTapGesture {
                        router.dismissScreen()
                    }
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundStyle(Color.spotifyWhite)
            .animation(.smooth(duration: 0.4), value: showHeader)
            .frame(maxHeight: .infinity, alignment: .topLeading)
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
    
    private func goToPlaylistView(product: Product) {
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product, user: user)
        }
    }
}

#Preview {
    RouterView { _ in
        SpotifyPlaylistView()
    }
}
