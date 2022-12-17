//
//  CoreDataBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/6/22.
//

import SwiftUI
import CoreData

class CoreDataVieModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func updateFruit(entity: FruitEntity) {
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
    
    func saveData() {
        
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving. \(error)")
        }
       
    }
}

struct CoreDataBootcamp: View {
    
    @StateObject var vm = CoreDataVieModel()
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add fruits here...", text: $textFieldText)
                    .font(.headline)
                    .frame(height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button {
                    guard !textFieldText.isEmpty else { return }
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                List {
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "No Name")
                            .onTapGesture {
                                vm.updateFruit(entity: entity)
                            }
                    }
                   
                    .onDelete(perform: vm.deleteFruit)
                }
                .listStyle(.plain)
                
                Spacer()

            }
            .navigationTitle("Fruits")
        }
    }
}

struct CoreDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootcamp()
    }
}
