//
//  MaskBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/3/22.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 2
    
    var body: some View {
        ZStack {
           starsView
                .overlay(
                   overlayView.mask(starsView)
                )
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .bottomTrailing, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
                
            }
        }
        .allowsHitTesting(false)
       
    }
    
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}
