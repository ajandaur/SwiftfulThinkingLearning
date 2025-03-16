//
//  User.swift
//  SwiftfulSwiftUIinPractice
//
//  Created by Anmol  Jandaur on 2/25/25.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let height, weight: Double
    
    var work: String {
        "Worker as Some Job"
    }
    var education: String {
        "Graduate Degree"
    }
    
    var aboutMe: String {
        "This is a sentence about me that will look good on my profile"
    }
   var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", text: "\(height)"),
            UserInterest(iconName: "graduationcap", text: "\(education)"),
            UserInterest(iconName: "winglass", text: "Socially"),
            UserInterest(iconName: "moon.stars.fill", text: "Virgo")
        ]
    }
    
    var interests: [UserInterest] {
        [
            UserInterest(emoji: "🏃", text: "Running"),
            UserInterest(emoji: "🏋️‍♀️", text: "Lifting"),
            UserInterest(emoji: "🎧 ", text: "Music"),
            UserInterest(emoji: "🧑🏽‍💻", text: "Coding"),
        ]
    }
    
    var images: [String] {
        ["https://picsum.photos/500/500", "https://picsum.photos/600/600", "https://picsum.photos/700/700"]
    }
    
    static var mock: User {
        User(
            id: 444,
            firstName: "Anmol",
            lastName: "Jandaur",
            maidenName: "K",
            age: 12,
            email: "hi@hi.com",
            phone: "",
            username: "",
            password: "",
            birthDate: "",
            image: "https://picsum.photos/200/300",
            height: 123,
            weight: 123
        )
    }
}
