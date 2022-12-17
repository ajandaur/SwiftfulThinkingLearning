//
//  GeometryReaderBootCamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 4/30/22.
//

import SwiftUI

struct GeometryReaderBootCamp: View {
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        // get middle x coordinate of rectangle
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
        
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40), axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                   
                }
            }
        }
        
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                Rectangle().fill(Color.red)
//                    .frame(width: geometry.size.width * 0.666)
//
//                Rectangle().fill(Color.blue)
//            }
//            .ignoresSafeArea()
//        }
    
    }
}

struct GeometryReaderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootCamp()
    }
}
