//
//  DownloadingImagesBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/23/22.
//

import SwiftUI

// background threads
// weak self
// Combine
// Publishers and Subscribers
// File Manager
// NSCache

struct DownloadingImagesBootcamp: View {
    
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images")
        }
    }
}

struct DownloadingImagesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImagesBootcamp()
    }
}
