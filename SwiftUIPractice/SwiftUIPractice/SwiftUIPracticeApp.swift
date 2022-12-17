//
//  SwiftUIPracticeApp.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 12/28/21.
//

import SwiftUI

@main
struct SwiftUIPracticeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
