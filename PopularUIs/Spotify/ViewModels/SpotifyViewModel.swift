//
//  SpotifyViewModel.swift
//  PopularUIs
//
//  Created by admin on 25/07/2024.
//

import Foundation

final class SpotifyViewModel: ObservableObject {
    @Published var currentUser: User? = nil
    @Published var selectedCategory: Category? = nil
    @Published var products: [Product] = []
    @Published var productRows: [ProductRow] = []
    
    init() {
        self.currentUser = currentUser
        self.selectedCategory = selectedCategory
        self.products = products
        self.productRows = productRows
    }
    
    func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map { $0.brand })
            for brand in allBrands {
                rows.append(ProductRow(title: brand?.capitalized ?? "", products: products))
            }
            productRows = rows
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}
