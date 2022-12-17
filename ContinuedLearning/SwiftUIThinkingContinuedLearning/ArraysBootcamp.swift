//
//  ArraysBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/5/22.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick", points: 4, isVerified: false)
        let user2 = UserModel(name: "Alex", points: 10, isVerified: true)
        let user3 = UserModel(name: "Tom", points: 14, isVerified: false)
        let user4 = UserModel(name: "Alec", points: 41, isVerified: true)
        let user5 = UserModel(name: "Larry", points: 2, isVerified: false)
        let user6 = UserModel(name: nil, points: 8, isVerified: false)
        let user7 = UserModel(name: "Parker", points: 24, isVerified: true)
        let user8 = UserModel(name: "Thomas", points: 44, isVerified: true)
        let user9 = UserModel(name: "Arthur", points: 64, isVerified: false)
        let user10 = UserModel(name: nil, points: 623, isVerified: true)
        

        self.dataArray.append(contentsOf: [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10] )
    }
    
    func updateFilteredArray() {
        
        // sort
        filteredArray = dataArray.sorted { $0.points > $1.points }
        
        // filter
        filteredArray = filteredArray.filter {$0.points > 10 }
        
        // map
//        mappedArray = dataArray.map { String($0.name) }
        
        // compactMap
        mappedArray = dataArray.compactMap { $0.name }
    }
    
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
//                ForEach(vm.mappedArray, id: \.self) { name in
//                    Text(name)
//                        .font(.title)
//                }
                ForEach(vm.filteredArray) { user in
                    VStack(alignment: .leading) {
                        Text(user.name ?? "No name")
                            .font(.headline)
                        HStack {
                            Text("Points: \(user.points)")
                            Spacer()
                            if user.isVerified {
                                Image(systemName: "flame.fill")
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.cornerRadius(10))
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
