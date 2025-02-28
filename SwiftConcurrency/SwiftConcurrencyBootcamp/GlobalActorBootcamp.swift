//
//  GlobalActorBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 1/25/25.
//

import SwiftUI

@globalActor final class MyFirstGlobalActor {
    static var shared = MyDataManager()
}

actor MyDataManager {
    
    func getDataFromDatabase() -> [String] {
        return ["One", "Two", "Three", "Four", "Five"]
    }
}

class GlobalActorBootcampViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    let manager = MyFirstGlobalActor.shared
    
    @MyFirstGlobalActor func getData() {
        
        // Heavy complex methods
        Task {
            let data = await manager.getDataFromDatabase()
            self.dataArray = data
        }
       
    }
}

struct GlobalActorBootcamp: View {
    
    @StateObject private var viewModel = GlobalActorBootcampViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.dataArray, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .task { await viewModel.getData() }
    }
}

#Preview {
    GlobalActorBootcamp()
}
