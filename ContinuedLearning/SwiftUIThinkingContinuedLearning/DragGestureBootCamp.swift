//
//  DragGestureBootCamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 4/29/22.
//

import SwiftUI

struct DragGestureBootCamp: View {
    
    @State var offset: CGSize = .zero
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(offset.width)")
                Spacer()
                
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
            )
        }
    } // body
    
    func getScaleAmount() -> CGFloat {
        // what is the maximum amount we can go left and eight
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentagAsDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentagAsDouble * maxAngle
    }
    
}

struct DragGestureBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootCamp()
    }
}
