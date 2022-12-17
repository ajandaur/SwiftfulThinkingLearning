//
//  BackgroundAndOverlay.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 12/28/21.
//

import SwiftUI

struct BackgroundAndOverlay: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .background(
                Circle()
                    .frame(width: 100, height: 100))
    }
}

struct BackgroundAndOverlay_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlay()
    }
}
