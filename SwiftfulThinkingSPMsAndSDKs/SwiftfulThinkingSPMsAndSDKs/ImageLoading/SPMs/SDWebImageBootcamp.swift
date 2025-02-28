//
//  SDWebImageBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Anmol  Jandaur on 2/20/25.
//

import SwiftUI
import SDWebImageSwiftUI


struct SDWebImageLoader: View {
    
    let url: String
    let contentMode: ContentMode = .fill
    
    var body: some View {
        WebImage(url: URL(string: url))
            .onSuccess { image, data, cacheType in
                //
            }
            .onFailure { error in
                //
            }
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}

struct SDWebImageBootcamp: View {
    var body: some View {
        VStack {
            ImageLoader(url: "https://picsum.photos/id/237/200/300")
                .frame(width: 100, height: 300)
                .onAppear {
                    ImagePrefetcher.instance.startPrefetching(urls: [])
                }
        }
    }
}

#Preview {
    SDWebImageBootcamp()
}
