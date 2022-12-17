//
//  HashableBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/5/22.
//

import SwiftUI

struct MyCustomModel: Identifiable {
    let title: String
    
    var id = UUID().uuidString
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR"),
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(data) { item in
                    Text(item.id)
                        .font(.headline)
                }
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
