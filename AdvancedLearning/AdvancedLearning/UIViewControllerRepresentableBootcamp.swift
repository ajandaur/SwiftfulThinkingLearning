//
//  UIViewControllerRepresentableBootcamp.swift
//  AdvancedLearning
//
//  Created by Anmol  Jandaur on 3/5/23.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
    
    @State private var showScreen = false
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            Text("HI")
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
            Button {
                // show screen
                showScreen.toggle()
            } label: {
                Text("Click Here")
            }
            .sheet(isPresented: $showScreen) {
//                BasicUIViewControllerRepresentable(labelText: "new text here")
                
                // 1. Bind to the image you want to mutate
                UIImagePickerControllerRepresentable(image: $image)
            }

        }
       
    }
}

struct UIViewControllerRepresentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerRepresentableBootcamp()
    }
}

struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.delegate = context.coordinator
       
        return vc
    }
    
    // Use this to go from SwiftUI --> UIKit
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    // Use this to go from UIKit --> SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Binding var image: UIImage?
        
        init(image: Binding<UIImage?>) {
            self._image = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return }
            image = newImage
        }
    }
}


struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        // basically like the init function.
        
        let vc = MyFirstViewController()
        vc.labelText = labelText
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // use to update data from SwiftUI TO UIKit View Controller
    }
}

class MyFirstViewController: UIViewController {
    
    var labelText: String = "Starting value"
    
    override func viewDidLoad() {
       
        view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor.white
        
        view.addSubview(label)
        label.frame = view.frame
        
       
    }
}
