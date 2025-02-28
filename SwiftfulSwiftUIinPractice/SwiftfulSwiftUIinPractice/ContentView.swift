//
//  ContentView.swift
//  SwiftfulSwiftUIinPractice
//
//  Created by Anmol  Jandaur on 2/25/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        VStack {
            ForEach(products) { product in
                Text(product.title)
                    .foregroundStyle(.spotifyGreen)
                
            }
        }
        .padding()
        .task  {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
