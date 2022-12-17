//
//  DownloadWithCombine.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/13/22.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
         // Create the publisher
        URLSession.shared.dataTaskPublisher(for: url)
        // subscribe publisher on the background thread
//            .subscribe(on: DispatchQueue.global(qos: .background))
        // recieve on main thread
            .receive(on: DispatchQueue.main)
        // tryMap (check that the data is good)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
        // put the item in our app
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished!")
                case .failure(let error):
                    print("There was an error. \(error)")
                }
            } receiveValue: { [weak self] returnPosts in
                

                self?.posts = returnPosts
            }
        // cancel subscription if needed
            .store(in: &cancellables)

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(URLError.badServerResponse)
        }
        return output.data
    }
}

struct DownloadWithCombine: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct DownloadWithCombine_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombine()
    }
}
