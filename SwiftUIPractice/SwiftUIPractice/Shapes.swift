//
//  Shapes.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 12/28/21.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
//        Circle()
//        Ellipse()
//        Capsule(style: .circular)
//        Rectangle()
        RoundedRectangle(cornerRadius: 50)
//            .fill(Color.blue)
//            .foregroundColor(.pink)
//            .stroke()
//            .stroke(Color.red)
//            .stroke(Color.blue, lineWidth: 30)
//            .stroke(Color.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [50]))
//            .trim(from: 0.2, to: 1.0)
//            .stroke(Color.purple, lineWidth: 20)
            .frame(width: 300, height: 200)
        
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
