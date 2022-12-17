//
//  ViewModifierBootcamp.swift
//  AdvancedLearning
//
//  Created by Anmol  Jandaur on 7/24/22.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        self
            .modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    
    var body: some View {
        VStack {
            Text("Hello world")
                .withDefaultButtonFormatting(backgroundColor: .blue)
            
            Text("Hello world")
                .font(.subheadline)
                .modifier(DefaultButtonViewModifier(backgroundColor: .orange))

            Text("Hello world")
                .withDefaultButtonFormatting(backgroundColor: .pink)
        }
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
