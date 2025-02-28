//
//  AsyncStreamBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 1/28/25.
//

import SwiftUI

class AsyncStreamDataManager {
    
    func getAsyncStream() -> AsyncThrowingStream<Int, Error> {
        AsyncThrowingStream { [weak self] continuation in
            self?.getFakeData(completion: { value in
                continuation.yield(value)
            }, onFinish: { error in
                continuation.finish(throwing: error)
            })
        }
    }
    
    
    func getFakeData(completion: @escaping (_ value: Int) -> Void,
                     onFinish: @escaping (_ error: Error?) -> Void) {
        let items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        for item in items {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(item)) {
                completion(item)
            }
        }
    }
}
@MainActor
final class AsyncStreamViewModel: ObservableObject {
    
    let manager = AsyncStreamDataManager()
    func onViewAppear() {
        Task {
            do {
                for try await value in manager.getAsyncStream() {
                    currentNumber = value
                }
            } catch {
                print(error)
            }
        }
    }
    
    @Published private(set) var currentNumber = 0 
}

struct AsyncStreamBootcamp: View {
    @StateObject private var viewModel = AsyncStreamViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.currentNumber)")
        }
        .onAppear {
            viewModel.onViewAppear()
        }
    }
}

#Preview {
    AsyncStreamBootcamp()
}
