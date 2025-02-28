//
//  Product.swift
//  SwiftfulSwiftUIinPractice
//
//  Created by Anmol  Jandaur on 2/25/25.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let images: [String]
    let thumbnail: String
}
