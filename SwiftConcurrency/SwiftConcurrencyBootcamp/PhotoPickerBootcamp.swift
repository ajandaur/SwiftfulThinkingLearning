//
//  PhotoPickerBootcmap.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 1/27/25.
//

import SwiftUI
import PhotosUI

@MainActor
final class PhotoPickerViewModel: ObservableObject {
    
    @Published private(set) var selectedImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            
        }
    }
    
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { return }
        
        Task {
          
        }
    }
}

struct PhotoPickerBootcamp: View {
    
    @StateObject private var viewModel = PhotoPickerViewModel()
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        
        if let image = viewModel.selectedImage {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .cornerRadius(10)
        }
        
        PhotosPicker(selection: $viewModel.imageSelection, matching: .images) {
            Text("Open the photo picker!")
                .foregroundStyle(.red)
        }
        
    }
}

#Preview {
    PhotoPickerBootcamp()
}
