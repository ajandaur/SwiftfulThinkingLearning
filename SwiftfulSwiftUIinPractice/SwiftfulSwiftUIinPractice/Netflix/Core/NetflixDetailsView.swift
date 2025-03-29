//
//  NetflixDetailsView.swift
//  SwiftfulSwiftUIinPractice
//
//  Created by Anmol  Jandaur on 3/29/25.
//

import SwiftUI

struct NetflixDetailsView: View {
    
    var product: Product = .mock
    @State private var progress: Double = 0.2
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.2).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView(imageName: product.firstImage,
                                         progress: progress, onAirplayPressed:  {
                    //
                }, onXMarkPressed: {
                    //
                }
                )
                
                
                ScrollView(.vertical) {
                    VStack(spacing: 16) {
                        NetflixDetailsProductView(
                            title: product.title,
                            isNew: true,
                            yearReleased: "2024",
                            seasonCount: 4,
                            hasClosedCaptions: true,
                            isTopTen: 6,
                            descriptionText: product.description,
                            castTest: "Cast: Nick, Anmol, Someone else") {
                                //
                            } onDownloadPressed: {
                                //
                            }
                        
                    }
                }
                .scrollIndicators(.hidden)
                
            }
        }
    }
}

#Preview {
    NetflixDetailsView()
}
