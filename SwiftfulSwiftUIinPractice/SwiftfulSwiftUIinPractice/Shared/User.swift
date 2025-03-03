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
            image: "",
            height: 123,
            weight: 123
        )
    }
}
