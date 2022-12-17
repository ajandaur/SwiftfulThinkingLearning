//
//  Transitions.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 12/28/21.
//

import SwiftUI

struct Transitions: View {
    
    @State var showView: Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("BUTTON") {
                    showView.toggle()
                }
                Spacer()
            }
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .bottom)
                    ))
                   
            }
          
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Transitions_Previews: PreviewProvider {
    static var previews: some View {
        Transitions()
    }
}
