//
//  ContextMenuBootCamp.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 12/29/21.
//

import SwiftUI

struct ContextMenuBootCamp: View {
    
    @State var backgroundColor: Color = Color.blue
    
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftful Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .background(Color.blue).cornerRadius(30)
        .contextMenu(menuItems: {
            Button(action: {
                backgroundColor = .yellow
            }, label: {
                Label("Share Post", systemImage: "flame.fill")
            })
            
            Button(action: {
                backgroundColor = .red
                
            }, label: {
                Text("Report Post")
            })
            
            Button(action: {
                backgroundColor = .green
            }, label: {
                HStack {
                    Text("Like Post")
                    Image(systemName: "heart.fill")
                }
            })
        })
    }
}

struct ContextMenuBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootCamp()
    }
}
