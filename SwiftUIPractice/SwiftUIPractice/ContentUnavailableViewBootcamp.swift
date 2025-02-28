//
//  ContentUnavailableViewBootcamp.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 2/9/25.
//

import SwiftUI

struct ContentUnavailableViewBootcamp: View {
    var body: some View {
        ContentUnavailableView("Some time", systemImage: "heart.fill", description: Text("This is some text"))
    }
}

#Preview {
    ContentUnavailableViewBootcamp()
}
