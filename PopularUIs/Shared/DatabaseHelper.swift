//
//  DatabaseHelper.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import Foundation

struct DatabaseHelper {
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products/1") else {
            throw URLError(.badURL)
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductsArray.self, from: data)
        return products.products
    }
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UsersArray.self, from: data)
        return users.users
    }
    
}

