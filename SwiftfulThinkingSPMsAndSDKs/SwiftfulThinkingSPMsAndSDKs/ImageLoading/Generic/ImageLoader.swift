//
//  ImageLoader.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Anmol  Jandaur on 2/21/25.
//

import SwiftUI

struct ImageLoader: View {
    
    let url: String
    let contentMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay(
                SDWebImageLoader(url: url)
            )
    }
}
