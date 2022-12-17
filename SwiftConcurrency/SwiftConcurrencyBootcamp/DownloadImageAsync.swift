//
//  DownloadImageAsync.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 5/31/22.
//

import SwiftUI
import Combine

class DownloadImageAsyncImageLoader {
    
    let url = URL(string: "https://picsum.photos/200")!
    
    func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard let data = data, let image = UIImage(data: data),
              let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
           
            return nil
        }
        return image
    }
    
    // need to manually create completion handlers and pass the data back
    // But you need to deal with verifying the data when you use inject the completion handler
    func downloadWithEscaping(completionHandler: @escaping (_ image: UIImage?, _ error: Error?) -> ()) {
         
        // there is a delay between the function and this completion
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
           
            let image = self?.handleResponse(data: data, response: response)
            completionHandler(image, error)
        }
        .resume()
    }
    
    
    // using Combine
    func downloadWithCombine() -> AnyPublisher<UIImage?, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(handleResponse)
            .mapError({ $0 })
            .eraseToAnyPublisher()
    }
    
    // Async-await is very easy to use and is safer.. we need to throw errors and use keywords to make sure we are asynchronous
    // we do not need to worry about [weak self]
    func downloadWithAsync() async throws -> UIImage? {
        // "await" keyword we are notifying the complier that we are suspending the task at this state and wait for the response before we continue
        do {
            let (data, response) = try await URLSession.shared.data(from: url, delegate: nil)
            return handleResponse(data: data, response: response)
        } catch {
            throw error
        }
       
    }
}


class DownloadImageAsyncViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let loader = DownloadImageAsyncImageLoader()
    var cancellables = Set<AnyCancellable>()
    
    func fetchImage() async {
        
        // await = marking the code as a suspension point
        let image = try? await loader.downloadWithAsync()
        // switching onto the MainActor is similar to switching onto the main thread
        // could make it another suspension point
        await MainActor.run {
            self.image = image
        }
      
        
//        loader.downloadWithEscaping { [weak self] image, error in
//            DispatchQueue.main.async {
//                self?.image = image
//            }
//        }
//        loader.downloadWithCombine()
//            .receive(on: DispatchQueue.main)
//            .sink { _ in
//
//            } receiveValue: { [weak self] image in
//                self?.image = image
//            }
//            .store(in: &cancellables)

    }
    
}
                  
                  

struct DownloadImageAsync: View {
    
    @StateObject private var viewModel = DownloadImageAsyncViewModel()
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable().scaledToFit()
                    .frame(width: 250, height: 250)
            }
        }
        .onAppear {
            // We enter a Task to get into an Asynchronous context
            Task {
                await viewModel.fetchImage()
            }
        }
    }
}

struct DownloadImageAsync_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageAsync()
    }
}
