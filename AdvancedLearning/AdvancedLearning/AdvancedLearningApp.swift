//
//  AdvancedLearningApp.swift
//  AdvancedLearning
//
//  Created by Anmol  Jandaur on 7/24/22.
//

import SwiftUI

@main
struct AdvancedLearningApp: App {
    
    let currentUserIsSignedIn: Bool
    
    init()  {
        
//        let userIsSignedIn = CommandLine.arguments.contains("-UITest_startSignedIn") ? true : false
        currentUserIsSignedIn = ProcessInfo.processInfo.arguments.contains("-UITest_startSignedIn") ? true : false
            
        print("USER IS SIGNED IN: \(currentUserIsSignedIn)")
        
    }
    var body: some Scene {
        WindowGroup {
            UITestingBootcampView(currentUserSignedIn: currentUserIsSignedIn)
        }
    }
}
