//
//  KeychainSwiftBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Anmol  Jandaur on 2/24/25.
//

import SwiftUI
import KeychainSwift

struct KeychainSwiftBootcamp: View {
    
    let keychain = KeychainSwift()
    @State private var userPassword: String = ""
    
    var body: some View {
        Button(userPassword.isEmpty ? "No password" : userPassword) {
            let newPassword = "def123"
            keychain.set(newPassword, forKey: "user_password")
            userPassword = newPassword
        }
        .onAppear {
            userPassword = keychain.get("user_password") ?? ""
        }
    }
}

#Preview {
    KeychainSwiftBootcamp()
}
