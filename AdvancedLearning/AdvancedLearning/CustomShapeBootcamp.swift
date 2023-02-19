//
//  CustomShapeBootcamp.swift
//  AdvancedLearning
//
//  Created by Anmol  Jandaur on 8/2/22.
//

import SwiftUI

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
    
    
    
}

struct CustomShapeBootcamp: View {
    var body: some View {
        ZStack {
            
            Triangle()
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, dash: [10]))
                .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 300, height: 300)
        }
    }
}

struct CustomShapeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeBootcamp()
    }
}
