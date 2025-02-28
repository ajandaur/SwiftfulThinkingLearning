//
//  KingfisherBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Anmol  Jandaur on 2/21/25.
//

import SwiftUI
import Kingfisher

struct KingfisherImageLoader: View {
    
    var url: String
    var contentMode: SwiftUI.ContentMode = .fill
    
    var body: some View {
        KFImage(URL(string: url))
            .placeholder {
                Color.red
            }
            .resizable()
            .aspectRatio(contentMode: contentMode)
            
    }
}

#Preview {
    KingfisherImageLoader(url: "https://picsum.photos/id/237/200/300", contentMode: .fill)
}
