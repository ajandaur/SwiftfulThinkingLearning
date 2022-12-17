//
//  DoCatchTryThrowsBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 5/30/22.
//

import SwiftUI

// do-catch
// try
// throws
class DoCatchTryThrowsBootcampDataManager {
    
    let isActive: Bool = true
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("NEW TEXT!", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("NEW TEXT!")
        } else {
            return .failure(URLError(.appTransportSecurityRequiresSecureConnection))
        }
    }
    
    func getTitle3() throws -> String {
        if isActive {
            return "NEW TEXT!"
        } else {
            throw URLError(.badServerResponse)
        }
    }
    
    func getTitle4() throws -> String {
        if isActive {
            return "FINAL TEXT!"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}
class DoCatchTryThrowsBootcampVM: ObservableObject {
    
    @Published var text: String = "Starting text."
    let manager = DoCatchTryThrowsBootcampDataManager()
    
    func fetchTitle() {
//        let returnedValue = manager.getTitle()
//        if let newTitle = returnedValue.title {
//            self.text = newTitle
//        } else if let error = returnedValue.error {
//            self.text = error.localizedDescription
//        }
//        let result = manager.getTitle2()
//
//        switch result {
//        case .success(let newTitle):
//            self.text = newTitle
//        case . failure(let error):
//            self.text = error.localizedDescription
//        }
        
        do {
            let newTitle = try? manager.getTitle3()
            if let newTitle = newTitle {
                self.text = newTitle
            }
            
            let finalText = try manager.getTitle4()
            self.text = finalText
            
        } catch let error {
            self.text = error.localizedDescription
        }
    }
}

struct DoCatchTryThrowsBootcamp: View {
    @StateObject private var vm = DoCatchTryThrowsBootcampVM()
    
    var body: some View {
        Text(vm.text)
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .onTapGesture {
                vm.fetchTitle()
            }
    }
}



struct DoCatchTryThrowsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DoCatchTryThrowsBootcamp()
    }
}
