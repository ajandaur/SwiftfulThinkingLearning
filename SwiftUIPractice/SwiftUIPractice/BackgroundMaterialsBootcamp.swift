//
//  BackgroundMaterialsBootcamp.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 12/30/21.
//

import SwiftUI

struct BackgroundMaterialsBootcamp: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .background(
        )
    }
}

struct BackgroundMaterialsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterialsBootcamp()
    }
}
