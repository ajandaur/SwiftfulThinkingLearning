//
//  AlignmentGuidesBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 2/9/25.
//

import SwiftUI

struct AlignmentGuidesBootcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            AlignmentChildView()
            
    
        }
   
    }
}

struct AlignmentChildView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            row(title: "Row 1")
            row(title: "Row 2")
            row(title: "Row 3")
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(40)
    }
    
    private func row(title: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: "info.circle")
                .frame(width: 30, height: 30)
        }
    }
}

#Preview {
    AlignmentGuidesBootcamp()
}
