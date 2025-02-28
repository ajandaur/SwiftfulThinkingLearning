//
//  ImagePrefetcher.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Anmol  Jandaur on 2/21/25.
//

import Foundation
import SDWebImage


final class ImagePrefetcher {
    
    static let instance = ImagePrefetcher()
    private let prefetcher = SDWebImagePrefetcher()
    
    private init() { }
    
    func startPrefetching(urls: [URL]) {
        prefetcher.prefetchURLs(urls)
    }
    
    func stopPrefetching() {
        prefetcher.cancelPrefetching()
    }
}
