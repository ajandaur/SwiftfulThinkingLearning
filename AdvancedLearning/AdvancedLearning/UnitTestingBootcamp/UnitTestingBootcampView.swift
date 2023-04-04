//
//  UnitTestingBootcampView.swift
//  AdvancedLearning
//
//  Created by Anmol  Jandaur on 3/30/23.
//

import SwiftUI

/*
 
 1. Unit Tests:
 - Tests the business logic of the app
 
 
 2. UI Tests:
 - Tests the UI of your app
 
 */



struct UnitTestingBootcampView: View {
    
    @StateObject private var vm: UnitTestingBootcampViewModel
    
    init(isPremium: Bool) {
        _vm =  StateObject(wrappedValue: UnitTestingBootcampViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct UnitTestingBootcampView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingBootcampView(isPremium: true)
    }
}
