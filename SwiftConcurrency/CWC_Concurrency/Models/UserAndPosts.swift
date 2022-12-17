//
//  UserAndPosts.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 8/28/22.
//

import Foundation

struct UserAndPosts: Identifiable {
    var id = UUID()
    let user: User
    let posts: [Post]
    var numberOfPosts: Int {
        posts.count
    }
}
