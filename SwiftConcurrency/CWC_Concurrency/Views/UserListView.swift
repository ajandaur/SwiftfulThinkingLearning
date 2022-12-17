//
//  UserListView.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 8/4/22.
//

import SwiftUI

struct UserListView: View {
    
    @StateObject var vm = UserListViewModel()
    
    var body: some View {
        List {
            ForEach(vm.usersAndPosts) { userAndPosts in
                NavigationLink {
                    PostListView(posts: userAndPosts.posts)
                } label: {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(userAndPosts.user.name)
                                .font(.title)
                            Spacer()
                            Text("(\(userAndPosts.numberOfPosts)")
                        }
                        Text(userAndPosts.user.email)
                    }
                }
            }
        }
        .overlay(content: {
            if vm.isLoading {
               ProgressView()
            }
        
        })
        .alert("Application Error", isPresented: $vm.showAlert, actions: {
            Button("OK") {}
        }, message: {
            if let errorMessage = vm.errorMessage {
                Text(errorMessage )
            }
        })
        .navigationTitle("Users")
        .listStyle(.plain)
        .task {
                await vm.fetchUsers()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
