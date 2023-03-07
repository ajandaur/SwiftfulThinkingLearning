//
//  DependencyInjectionBootcamp.swift
//  AdvancedLearning
//
//  Created by Anmol  Jandaur on 3/7/23.
//

import SwiftUI
import Combine

// PROBLEM WITH SINGLETONS
// 1. Singletons are GLOBAL
// 2. Can't customize the init!
// 3. You can't swap out dependencies!


struct PostsModel: Codable, Identifiable {
    /*
     
     {
     "userId": 1,
     "id": 1,
     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
     },
     
     */
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
}


// must have a function that has getData that returns AnyPublisher
protocol DataServiceProtocol {
    func getData() -> AnyPublisher<[PostsModel], Error>
}

class ProductionDataService: DataServiceProtocol {
    
    // You have to type in the initialize whe you make the singleton in the class
    // you can't change it..
//    static let instance = ProductionDataService(title: "")
    
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map( { $0.data })
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class MockDataService: DataServiceProtocol {
    
    let testData: [PostsModel]
    
    init(data: [PostsModel]?) {
        self.testData = data ?? [
        PostsModel(userId: 1, id: 1, title: "one", body: "one")
        ]
    }

    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        Just(testData)
            .tryMap( { $0 })
            .eraseToAnyPublisher()
    }
    
    
}


class DependencyInjectionViewModel: ObservableObject {
    
    @Published var dataArray: [PostsModel] = []
    var cancellables = Set<AnyCancellable>()
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        loadPosts()
    }
    
    private func loadPosts() {
        dataService.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] returnedPosts in
                self?.dataArray = returnedPosts
            }
            .store(in: &cancellables)

    }
    
}

struct DependencyInjectionBootcamp: View {
    
    
    // inject the data service into the view using teh init!
    @StateObject private var vm: DependencyInjectionViewModel
    
    init(dataService: DataServiceProtocol) {
        _vm = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

struct DependencyInjectionBootcamp_Previews: PreviewProvider {
    
//    static let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    static let dataService = MockDataService(data: [
    PostsModel(userId: 1, id: 1, title: "title", body: "one")])
    
    static var previews: some View {
        DependencyInjectionBootcamp(dataService: dataService)
    }
}
