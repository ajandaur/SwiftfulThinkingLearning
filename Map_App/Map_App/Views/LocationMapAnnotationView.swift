//
//  LocationMapAnnotationView.swift
//  Map_App
//
//  Created by Anmol  Jandaur on 3/28/22.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    var body: some View {
        VStack(spacing: 0 ) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.red)
                .clipShape(Circle())
            
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.red)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LocationMapAnnotationView()
        }
    }
}
