//
//  GenericsBootcamp.swift
//  AdvancedLearning
//
//  Created by Anmol  Jandaur on 2/18/23.
//

import SwiftUI

struct StringModel {

    let info: String?
    
    func removeInfo() -> StringModel
    {
        return StringModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "Hello , world!")
    
    @Published var genericStringModel = GenericModel(info: "Hello, world!")
    
    @Published var genericBoolModel = GenericModel(info: true)
    
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}

struct GenericModel<T> {
    let info: T?
    
    func removeInfo() -> GenericModel
    {
        return GenericModel(info: nil)
    }
}

struct GenericView<CustomType: View> : View {
    
    let content: CustomType
    let title: String
    
    var body: some View {
        
        VStack {
            Text(title)
            content
        }
        
    }
}

struct GenericsBootcamp: View {
    
    @StateObject private var vm = GenericsViewModel()
    var body: some View {
        VStack {
            GenericView(content: Text("Custom content"), title: "new view!")
            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")
                .onTapGesture {
                    vm.removeData()
                }
        }
    }
}

struct GenericsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericsBootcamp()
    }
}
