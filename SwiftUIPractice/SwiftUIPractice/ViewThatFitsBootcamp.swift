//
//  ViewThatFitsBootcmap.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 2/9/25.
//

import SwiftUI

struct ViewThatFitsBootcamp: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            ViewThatFits(in: .vertical) {
                Text("This is some text I would like to display to the user!")
                Text("This is some text I would like to display!")
                Text("This is some text!")
            }
        }
        .frame(height: 300)
        .padding(16)
        .font(.headline)
    }
}

#Preview {
    ViewThatFitsBootcamp()
}
