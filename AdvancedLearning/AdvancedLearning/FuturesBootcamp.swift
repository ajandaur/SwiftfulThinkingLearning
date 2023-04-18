//
//  FuturesBootcamp.swift
//  AdvancedLearning
//
//  Created by Anmol  Jandaur on 4/17/23.
//

import SwiftUI
import Combine

// download with Combine
// download with @escaping closure
// convert @escaping closure to Combine

class FuturesBootcampViewModel: ObservableObject {
    
    @Published var title: String = "Starting title"
    let url = URL(string: "http://www.google.com")!
    var cancellables = Set<AnyCancellable>()
    
    init() {
        download()
    }
    
    func download() {
        
//        getCombinePublisher()
        getFuturePublisher()
            .sink { _ in

            } receiveValue: { [weak self] returnedValue in
                self?.title = returnedValue
            }
            .store(in: &cancellables)
        
//        getEscapingClosure { [weak self] returnedValue, error in
//            self?.title = returnedValue
//        }

    }
    
    func getCombinePublisher() -> AnyPublisher<String, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .timeout(1, scheduler: DispatchQueue.main)
            .map( { _ in
                return "New value"
            })
            .eraseToAnyPublisher()
        // we want to return this publisher..
    }
    
    // we essentially took a closure that does not have a publisher and turned it into a publisher that emits only a single value
    func getEscapingClosure(completionHandler: @escaping (_ value: String, _ error: Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completionHandler("New value 2", nil)
        }
        .resume()
    }
    
    // The difference with Future is that it produces a SINGLE value
    // a Publisher can present multiple values
    // They are different, but for that one value, we can subscribe to it like any other publisher
    func getFuturePublisher() -> Future<String, Error> {
        
        Future { promise in
            // call our @escaping closure
            self.getEscapingClosure { returnedValue, error in
                // we fulfill the promise in here
                // the promise will either finish or fail..
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(returnedValue))
                }
            }
        }
    }
    
    
    // Another example of a future..
    func doSomething(completion: @escaping (_ value: String) -> ()) {
        // We can't return like this in asynchronous code
        // Instead of returning a string, we use a completion handler
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            completion("NEW STRING")
        }
    }
    
    func doSomethingInTheFuture() -> Future<String, Never> {
        Future { promise in
            self.doSomething { value in
                promise(.success(value))
            }
        }
    }
    
    
}

struct FuturesBootcamp: View {
    
    @StateObject private var vm = FuturesBootcampViewModel()
    
    var body: some View {
        Text(vm.title)
    }
}

struct FuturesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FuturesBootcamp()
    }
}
