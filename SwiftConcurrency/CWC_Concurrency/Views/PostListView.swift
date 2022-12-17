//
//  PostListView.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 8/5/22.
//

import SwiftUI

struct PostListView: View {
    var posts: [Post]
    
    var body: some View {
        List {
            ForEach(posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.title)
                    Text(post.body)
                }
            }
        }
        .navigationTitle("Posts")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
   
    }
}

//struct PostListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            PostListView(userId: 1)
//        }
//        
//    }
//}
