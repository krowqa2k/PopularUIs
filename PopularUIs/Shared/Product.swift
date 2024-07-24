//
//  Product.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import Foundation

struct ProductsArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description, category: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let brand: String?
    let thumbnail: String
    let images: [String]
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    static var mock: Product {
        Product(
            id: 123,
            title: "Example",
            description: "This is some mock product description",
            category: "Electronic Devices",
            price: 999,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            brand: "Apple",
            thumbnail: Constants.randomImage,
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage]
        )
    }
}

struct ProductRow: Identifiable {
    let id = UUID()
    let title: String
    let products: [Product]
}

