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
    let tags: [String]
    let brand, sku: String
    let weight: Int
    let warrantyInformation, shippingInformation, availabilityStatus: String
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let thumbnail: String
    let images: [String]
}


