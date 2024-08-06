//
//  NetflixHomeView.swift
//  PopularUIs
//
//  Created by Mateusz Krówczyński on 06/08/2024.
//

import SwiftUI

struct NetflixHomeView: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    @State private var fullHeaderSize:CGSize = .zero
    @State private var heroProduct: Product? = nil
    
    @State private var currentUser: User? = nil
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(spacing: 8){
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                        
                    
                    if let heroProduct {
                        NetflixHeroCell(
                            imageName: heroProduct.firstImage,
                            isNetflixFilm: true,
                            title: heroProduct.title,
                            categories: [heroProduct.category.capitalized, heroProduct.brand ?? ""]) {
                                
                            } onMyListPressed: {
                                
                            } onPlayPressed: {
                                
                            }

                    }
                }
            }
            .scrollIndicators(.hidden)
            
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                
                NetflixFilterBarView(
                    filters: filters,
                    selectedFilter: selectedFilter,
                    onFilterPressed: { newFilter in
                        selectedFilter = newFilter
                    },
                    onXMarkPressed: {
                        selectedFilter = nil
                    }
                )
                .padding(.top, 16)
            }
            .readingFrame { frame in
                fullHeaderSize = frame.size
            }
        }
        .foregroundStyle(.netflixWhite)
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
        
    private func getData() async {
        guard productRows.isEmpty else { return }
            
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            let products = try await DatabaseHelper().getProducts()
            heroProduct = products.first
                
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand }))
            for brand in allBrands {

                rows.append(ProductRow(title: brand?.capitalized ?? "", products: products.shuffled()))
            }
            productRows = rows
        } catch {
                
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
        }
    }
}

#Preview {
    NetflixHomeView()
}
