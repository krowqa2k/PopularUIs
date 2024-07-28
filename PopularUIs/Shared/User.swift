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
    var aboutMe: String = "This is a sentance about me that will look good on my profile"
    
    var basics: [UserInterest] {
        [UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
         UserInterest(iconName: "graduationcap", emoji: nil, text: education),
         UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
         UserInterest(iconName: "moon.stars.fill", emoji: nil, text: "Virgo")
        ]
    }
    
    var interests: [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "👟", text: "Running"),
            UserInterest(iconName: nil, emoji: "🏋️‍♀️", text: "Gym"),
            UserInterest(iconName: nil, emoji: "🎧", text: "Music"),
            UserInterest(iconName: nil, emoji: "🥘", text: "Cooking")
        ]
    }
    
    var images: [String] {
        ["https://picsum.photos/500/500","https://picsum.photos/600/600","https://picsum.photos/700/700"]
    }
    
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
