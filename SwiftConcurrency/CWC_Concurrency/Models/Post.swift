//
//  Post.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 8/2/22.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
