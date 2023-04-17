//
//  AdvancedCombineBootcamp.swift
//  AdvancedLearning
//
//  Created by Anmol  Jandaur on 4/13/23.
//

import SwiftUI
import Combine

// This class is not being observed from any property wrappers in the view
// therefore, the class doesn't need to be an ObservableObject
class AdvancedCombineDataService {
    
    // the @Published wrapper is very common..
    // What does it really do for this variable??
    // There are two types of publishers in Combine though
    // @Published var basicPublisher: String = "first publish"
    
    // publishes an element when the value changes
    // you need to give it a type
    // the currentValueSubject holds a current value
    // you must initialize it with the type you give it
    // let currentValuePublisher = CurrentValueSubject<Int, Error>(1)
    
    // This works as the CurrentValueSubject but it does NOT hold a value
    // If you didn't need to hold the reference to the array, you can use PassThroughSubject
    let passThroughPublisher = PassthroughSubject<Int, Error>()
    
    let boolPublisher = PassthroughSubject<Bool, Error>()
    let intPublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
        let items: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])
                
                if (x > 4 && x < 8) {
                    self.boolPublisher.send(true)
                    self.intPublisher.send(999)
                } else {
                    self.boolPublisher.send(false)
                }
                // let publisher know it has eneded

                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
            }
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
//            self.passThroughPublisher.send(1)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.passThroughPublisher.send(2)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            self.passThroughPublisher.send(3)
//        }
        
    }
    
}

class AdvancedCombineBootcampViewModel: ObservableObject {
    
    @Published var data: [String] = []
    @Published var dataBools: [Bool] = []
    @Published var error: String = ""
    
    
    let dataService = AdvancedCombineDataService()
    
    var cancellables = Set<AnyCancellable>()
    let multiCastPublisher = PassthroughSubject<Int, Error>()
    
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {

        
        // Sequence Operations
        /*
         //   .first(where: { $0 > 4 })
        
        // you are able to throw errors if you are getting specific publishes
//            .tryFirst(where: { int in
//
//                if int == 3 {
//                    throw URLError(.badServerResponse)
//                }
//
//                return int > 1
//            })
            
        
//            .last(where: { $0 < 4 })
//            .tryLast(where: { int in
//                if int == 13 {
//                    throw URLError(.badServerResponse)
//                }
//                return int > 1
//            })

        // This drops the first publish
//            .dropFirst()
            // .drop(while: { $0 < 3 } )
//            .tryDrop(while: { int in
//                if int == 5 {
//                    throw URLError(.badServerResponse)
//                }
//                return int < 6
//            })
//            .prefix(4)
//            .prefix(while: { $0 < 5 })
//            .tryPrefix(while: )
            // .output(at: 5)
//            .output(in: 2..<4)
        
        */
        
        // Mathematic Operators
        //    .max()
//            .max(by: { int1, int2 in
//                return int1 < int2
//            })
//            .tryMax(by: )
//            .min()
        
        // Filter / Reducing Operations
//            .map({ String($0) })
//            .tryMap({ int in
//
//                if int == 5 {
//                    throw URLError(.badServerResponse)
//                }
//
//                 return String(int)
//            })
//            .compactMap({ int in
//                if int == 5 {
//                    return nil
//                }
//
//                return String(int)
//            })
//            .tryCompactMap()
        
//            .filter({ $0 > 3 && ($0 < 7) })
//            .tryFilter()
//            .removeDuplicates()
//            .removeDuplicates(by: { Int1, int2 in
//                return int1 == int2
//            })
//            .replaceNil(with: 5)
            // .replaceEmpty(with: [])
//            .replaceError(with: "DEFAULT VALUE")
//            .scan(5, { existingValue, newValue in
//                return existingValue + newValue
//            })
            // .scan(0, {$0 + $1} )
//            .scan(0, +)
//            .tryScan()
//            .reduce(0, { existingValue, newValue in
//                return existingValue + newValue
//            })
//            .reduce((0, +)
          
        
        // by collecting, you are putting them into an array
//            .collect()
        //    .allSatisfy({ $0 == 50 })
        //    .tryAllSatisfy()
        
        // Timing Operations
        /*
//            .debounce(for: 1, scheduler: DispatchQueue.main)
//            .delay(for: 2, scheduler: DispatchQueue.main)
            // .measureInterval(using: DispatchQueue.main)
//            .map( { stride in
//                return "\(stride.timeInterval)"
//            })
        
        // Whatever is published in those 10 seconds, it will get the latest value in those 10 seconds..
//            .throttle(for: 10, scheduler: DispatchQueue.main, latest: true)
//            .retry(3)
           // .timeout(0.75, scheduler: DispatchQueue.main)
        */
        
        // Multiple Publisher / Subscribers
        
        // use .combineLatest to combine two publishers values
//            .combineLatest(dataService.boolPublisher, dataService.intPublisher)
//            .compactMap({ (int, bool) in
//                // how do we want to handle both of these publishes..
//                if bool {
//                    return String(int)
//                }
//                return nil
//            })
//            .compactMap({ $1 ? String($0) : "n/a" })
//            .compactMap({ (int1, bool, int2) in
//                // if all three publish separately..
//                if bool {
//                    return String(int1)
//                }
//                return "n/a"
//            })
//            .merge(with: dataService.intPublisher)
//            .zip(dataService.boolPublisher)
//            .map({ tuple in
//                return String(tuple.0) + tuple.1.description
//                + String(tuple.2)
//            })
//            .tryMap({ _ in
//                throw URLError(.badServerResponse)
//            })
//            .catch({ error in
//                return self.dataService.intPublisher
//            })
        
        let sharedPublisher = dataService.passThroughPublisher
//            .dropFirst(3)
            .share()
//            .multicast {
//                PassthroughSubject<Int, Error>()
//            }
            .multicast(subject: multiCastPublisher)
        
        sharedPublisher
            .map({ String($0) })
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "Error \(error)"
              
                }
                
            } receiveValue: { [weak self] returnedValue in
                self?.data.append(returnedValue)
//                self?.data = returnedValue
            }
            .store(in: &cancellables)
        
        sharedPublisher
            .map({ $0 > 5 ? true : false })
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "Error \(error)"
              
                }
                
            } receiveValue: { [weak self] returnedValue in
                self?.dataBools.append(returnedValue)
//                self?.data = returnedValue
            }
            .store(in: &cancellables)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            sharedPublisher
                .connect()
                .store(in: &self.cancellables)
        }
    }
}

struct AdvancedCombineBootcamp: View {
    
    @StateObject private var vm = AdvancedCombineBootcampViewModel()
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    ForEach(vm.data, id: \.self) {
                        Text($0)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                    
                    if !vm.error.isEmpty {
                        Text(vm.error)
                    }
                }
                
                VStack {
                    ForEach(vm.dataBools, id: \.self) {
                        Text($0.description)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                    
                    if !vm.error.isEmpty {
                        Text(vm.error)
                    }
                }
            }
        }
    }
}

struct AdvancedCombineBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedCombineBootcamp()
    }
}
