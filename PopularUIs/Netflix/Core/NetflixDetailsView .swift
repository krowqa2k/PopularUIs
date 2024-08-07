//
//  NetflixDetailsView .swift
//  PopularUIs
//
//  Created by Mateusz Krówczyński on 07/08/2024.
//

import SwiftUI

struct NetflixDetailsView_: View {
    
    @Environment(\.router) var router
    
    var product: Product = .mock
    
    @State private var progress: Double = 0.2
    @State private var isMyList: Bool = false
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.2).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView_(
                    imageName: product.firstImage,
                    progress: progress) {
                        
                    } onXmarkPressed: {
                        router.dismissScreen()
                    }
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        NetflixDetailsProductView(
                            title: product.title,
                            isNew: true,
                            yearReleased: "2024",
                            seasonCount: 4,
                            hasClosedCaptions: true,
                            isTopTen: 6,
                            descriptionText: product.description,
                            castText: "Cast: Mateusz, Someone, Someone Else") {
                                
                            } onDownloadsPressed: {
                                
                            }

                        HStack(spacing: 32) {
                            MyListButton(isMyList: isMyList) {
                                isMyList.toggle()
                            }
                            
                            RateButton { selection in
                                
                            }
                            
                            ShareButton()
                        }
                        .padding(.leading, 32)
                        
                        VStack(alignment: .leading) {
                            Text("More Like This")
                                .font(.headline)
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3),
                                      alignment: .center,
                                      spacing: 8,
                                      pinnedViews: [],
                                      content: {
                                ForEach(products) { product in
                                    NetflixMovieCell(
                                        imageName: product.firstImage,
                                        title: product.title,
                                        isRecentlyAdded: product.recentlyAdded,
                                        topTenRanking: nil
                                    )
                                    .onTapGesture {
                                        onProductPressed(product: product)
                                    }
                                }
                            })
                        }
                        .foregroundStyle(.netflixWhite)
                    }
                }
                .padding(8)
            }
            .padding(8)
            .scrollIndicators(.hidden)
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
        .ignoresSafeArea(edges: .bottom)
    }
    
    private func onProductPressed(product: Product) {
        router.showScreen(.sheet) { _ in
            NetflixDetailsView_(product: product)
        }
    }
    
    private func getData() async {
        guard products.isEmpty else { return }
            
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
                
        }
    }
}

#Preview {
    NetflixDetailsView_()
}
