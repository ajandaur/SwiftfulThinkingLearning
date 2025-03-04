//
//  ContentView.swift
//  SwiftfulSwiftUIinPractice
//
//  Created by Anmol  Jandaur on 2/25/25.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
 
    var body: some View {
        VStack {
            List {
                Button("Open Spotify") {
                    router.showScreen(.fullScreenCover) { _ in
                        SpotifyHomeView()
                    }
                }
            }
        }
    }

}

#Preview {
    ContentView()
}
