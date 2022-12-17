//
//  NavigationView.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 12/28/21.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                NavigationLink("Hellow world!", destination: Text("Second screen."))
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
            .navigationTitle("All Inboxes")
            //.navigationBarTitleDisplayMode(.inline)
            //.navigationBarHidden(true)
    
        }
    }
}


struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewBootcamp()
    }
}
