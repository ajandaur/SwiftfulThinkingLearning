//
//  Users.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 8/2/22.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let test: String
}

