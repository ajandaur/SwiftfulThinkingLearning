//
//  MultipleSheetsBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 4/30/22.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    
}

// 1 - Use a binding


// 2 - Use multiple .sheets

// 3 Use $item

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel? = nil
    
    @State var showSheet: Bool = false
    @State var showSheet2: Bool = false
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
        }
        
        
        //        .sheet(isPresented: $showSheet, content: {
        //            NextScreen(selectedModel: selectedModel)
        //        })
        
    }
}

struct NextScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
