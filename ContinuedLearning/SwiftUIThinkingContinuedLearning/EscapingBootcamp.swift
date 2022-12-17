//
//  EscapingBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/13/22.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData4 { [weak self] returnedResult in
            self?.text = returnedResult.data
        }
    }
    
    func downloadData() -> String {
        return "New data!"
    }
    
    func downloadData2(completion: (_ data: String) -> ()) {
        completion("New data!")
    }
    
    func downloadData3(completion: @escaping (_ data: String) -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completion("New data!")
        }
      
    }
    
    func downloadData4(completion: @escaping (DownloadResult) -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!")
            completion(result)
        }
    }
    
    func downloadData5(completion: @escaping DownloadCompletion) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!")
            completion(result)
        }
    }
    
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}
