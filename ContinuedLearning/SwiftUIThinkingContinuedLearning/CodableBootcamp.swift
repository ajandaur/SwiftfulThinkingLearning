//
//  CodableBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/13/22.
//

import SwiftUI

struct CustomerModel:Identifiable, Codable {
    let name: String
    let points: Int
    let isPremium: Bool
    let id: String
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//    }
//
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey:  .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//
//    init(from encoder: Encoder) throws {
//        let container = try encoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.encode(id, forKey: .id)
//        self.name = try container.encode(name, forKey: .name)
//        self.points = try container.encode(points, forKey:  .points)
//        self.isPremium = try container.encode(isPremium, forKey: .isPremium)
//    }
}

class CodableViewModel: ObservableObject {
    
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else { return }
        
        
        
        do {
            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
        } catch let error {
            print("Error decoding. \(error)")
        }
        
        //      if
        //        let localData = try? JSONSerialization.jsonObject(with: data, options: []),
        //        let dictionary = localData as? [String: Any],
        //        let id = dictionary["id"] as? String,
        //        let name = dictionary["name"] as? String,
        //        let points = dictionary["points"] as? Int,
        //        let isPremium = dictionary["isPremium"] as? Bool
        //        {
        //
        //
        //
        //            let newCustomer = CustomerModel(name: name, points: points, isPremium: isPremium, id: id)
        ////            customer = newCustomer
        //        }
    }
    
    func getJSONData() -> Data? {
//        let dictionary: [String: Any] = [
//            "id":"12345",
//            "name": "Joe",
//            "points": 5,
//            "isPremium" : true
//        ]
        
        let customer = CustomerModel(name: "Emilty", points: 100, isPremium: true, id: "132")
        let jsonData = try? JSONEncoder().encode(customer)
        return jsonData
    }
}

struct CodableBootcamp: View {
    
    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

struct CodableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CodableBootcamp()
    }
}
