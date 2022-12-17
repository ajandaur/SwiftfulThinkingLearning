//
//  Colors.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 12/28/21.
//

import SwiftUI

struct Colors: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(Color.red)
            .frame(width: 300, height: 300)
    }
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        Colors()
    }
}
