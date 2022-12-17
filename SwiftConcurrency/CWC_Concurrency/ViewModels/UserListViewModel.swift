//
//  UserListViewModel.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 8/5/22.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var usersAndPosts: [UserAndPosts] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    
    @MainActor
    func fetchUsers() async {
        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
        let apiService2 = APIService(urlString: "https://jsonplaceholder.typicode.com/posts")
        isLoading.toggle()
        defer {
            isLoading.toggle()
        }
        do {
            async let users: [User] = try await apiService.getJSON()
            async let posts: [Post] = try await apiService2.getJSON()
            let (fetchedUsers, fetchedPosts) = await (try users, try posts)
            
            for user in fetchedUsers {
                let userPosts = fetchedPosts.filter { $0.userId == user.id }
                let newUserAndPosts = UserAndPosts(user: user, posts: userPosts)
                usersAndPosts.append(newUserAndPosts)
            }
        
        } catch {
            showAlert = true
            errorMessage = error.localizedDescription + "\nPlease contact the developer and provide the steps to reproduce error"
        }

    }
    
}
