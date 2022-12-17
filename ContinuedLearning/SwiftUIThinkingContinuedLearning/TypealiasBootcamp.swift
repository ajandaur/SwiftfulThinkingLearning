//
//  Typealias.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/10/22.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}


typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
    
    @State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
    
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct Typealias_Previews: PreviewProvider {
    static var previews: some View {
        TypealiasBootcamp()
    }
}
