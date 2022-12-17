//
//  AppStorageBootcamp.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 12/30/21.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
    @AppStorage("name") var currentUsername: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUsername ?? "Add Name Here")
            
            if let name = currentUsername {
                Text(name)
            }
            
            Button("Save".uppercased()) {
                let name: String = "Emily"
                currentUsername = name
                
            }
        }
    }
}

struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
