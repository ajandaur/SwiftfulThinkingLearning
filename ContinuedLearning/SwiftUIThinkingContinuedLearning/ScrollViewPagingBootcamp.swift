//
//  ScrollViewPagingBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 2/9/25.
//

import SwiftUI

struct ScrollViewPagingBootcamp: View {
    @State private var scrollPosition: Int? = nil
    var body: some View {
        VStack {
            Button("SCROLL TO") {
                scrollPosition = (0..<20).randomElement()!
            }
        }
        ScrollView(.horizontal) {
            HStack(spacing: 0) {
                ForEach(0..<20) { index in
                    Rectangle()
                        .frame(width: 300, height: 300)
                        .cornerRadius(10)
                        .overlay(
                            Text("\(index)")
                                .foregroundStyle(.white)
                        )
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .id(index)
                        .scrollTransition(.animated) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0)
                                .offset(y: phase.isIdentity ? 0 : -100)
                        }
//                        .containerRelativeFrame(.vertical, alignment: .center)
                }
            }
        }
        .ignoresSafeArea()
        .scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned)
        .scrollBounceBehavior(.basedOnSize)
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .animation(.smooth, value: scrollPosition)
//        ScrollView {
//            VStack(spacing: 30) {
//                ForEach(0..<10) { index in
//                    Rectangle()
////                        .frame(width: 300, height: 300)
//                        .overlay(
//                            Text("\(index)")
//                                .foregroundStyle(.white)
//                        )
//                        .frame(maxWidth: .infinity)
//                        .containerRelativeFrame(.vertical, alignment: .center)
//                }
//            }
//        }
//        .ignoresSafeArea()
//        .scrollTargetLayout()
//        .scrollTargetBehavior(.viewAligned)
//        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    ScrollViewPagingBootcamp()
}
