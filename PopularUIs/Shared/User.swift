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
    
    var work: String = "Worker as some job"
    var education: String = "Graduate Degree"
    
    static var mock: User {
            User(
                id: 1,
                firstName: "Mateusz",
                lastName: "Krówczyński",
                maidenName: "Nowak",
                age: 30,
                gender: "male",
                email: "jan.kowalski@example.com",
                phone: "+48123456789",
                username: "jankowalski",
                password: "securepassword123",
                birthDate: "1994-05-20",
                image: Constants.randomImage,
                bloodGroup: "A+",
                height: 180.5,
                weight: 75.0
            )
        }
}
