//
//  User.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import Foundation

struct UsersArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender, email, phone, username: String
    let password, birthDate, image, bloodGroup: String
    let height, weight: Double
}
