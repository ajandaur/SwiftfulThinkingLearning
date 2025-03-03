//
//  SongRowCell.swift
//  SwiftfulSwiftUIinPractice
//
//  Created by Anmol  Jandaur on 3/3/25.
//

import SwiftUI

struct SongRowCell: View {
    
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Some asd lasjd"
    var substitle: String? = "Some laksdlkasdj"
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    
    var body: some View {
        HStack(spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                
                if let substitle {
                    Text(substitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
            .foregroundStyle(.red)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
}
