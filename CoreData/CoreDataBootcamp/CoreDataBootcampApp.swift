//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by Anmol  Jandaur on 5/5/22.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
