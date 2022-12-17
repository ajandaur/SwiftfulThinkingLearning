//
//  Map_AppApp.swift
//  Map_App
//
//  Created by Anmol  Jandaur on 3/8/22.
//

import SwiftUI

@main
struct Map_AppApp: App {
    
    @StateObject private var viewModel = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
