//
//  NetflixHeroCell.swift
//  SwiftfulSwiftUIinPractice
//
//  Created by Anmol  Jandaur on 3/25/25.
//

import SwiftUI
import SwiftfulUI

struct NetflixHeroCell: View {
    
    var imageName: String = Constants.randomImage
    var isNetflixFilm = true
    var title: String = "Players"
    var categories: [String] = ["Raunchy", "Romantic", "Comedy"]
    var onBackgroundPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var onMyListPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            
            VStack(spacing: 16) {
                VStack(spacing: 0) {
                    if isNetflixFilm {
                        HStack(spacing: 0) {
                            Text("N")
                                .foregroundStyle(.netflixRed)
                                .font(.largeTitle)
                                .fontWeight(.black)
                            
                            Text("F I L M")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.netflixLightGray)
                        }
                    }
                    Text(title)
                        .font(.system(size: 50, weight: .medium, design: .serif))
                }
                
                HStack(spacing: 8) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .font(.callout)
                        
                        if category != categories.last {
                            Circle()
                                .frame(width: 4, height: 4)
                        }
                    }
                }
                
                HStack(spacing: 16) {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("Play")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundStyle(.netflixDarkGray)
                    .background(.netflixWhite)
                    .clipShape(Capsule())
                    .asButton {
                        onPlayPressed?()
                    }
                    
                    HStack {
                        Image(systemName: "plus")
                        Text("My List")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundStyle(.netflixWhite)
                    .background(.netflixDarkGray)
                    .clipShape(Capsule())
                    .asButton {
                        onMyListPressed?()
                    }
                }
                .font(.callout)
                .fontWeight(.medium)
            }
            .padding(24)
            .background(
                LinearGradient(
                    colors: [
                        .netflixBlack.opacity(0),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .foregroundStyle(.netflixWhite)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .aspectRatio(0.8, contentMode: .fit)
        .asButton {
            onBackgroundPressed?()
        }

    }
}


#Preview {
    NetflixHeroCell()
        .padding(40)
}
