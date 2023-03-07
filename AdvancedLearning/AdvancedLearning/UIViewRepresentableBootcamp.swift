//
//  UIViewRepresentableBootcamp.swift
//  AdvancedLearning
//
//  Created by Anmol  Jandaur on 2/27/23.
//

import SwiftUI

// Used to convert a UI View from UIKit to SwiftUI
struct UIViewRepresentableBootcamp: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            HStack {
                Text("SwiftUI")
                TextField("Type here...", text: $text)
                    .frame(height: 55)
                .background(Color.gray)
            }
            
            HStack {
                Text("UIKIT")
                UITextFieldViewRepresentable(text: $text)
                    .updatePlaceholder("NEW PLACEHOLDER")
                    .frame(height: 55)
                    .background(Color.gray)
            }
        }
    }
}

struct UIViewRepresentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewRepresentableBootcamp()
    }
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    var placeholder: String
    let placeholderColor: UIColor
    
    init(text: Binding<String>, placeholder: String = "Default", placeholderColor: UIColor = .red) {
        self._text = text
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
    }
    
    func makeUIView(context: Context) -> UITextField {
        
        let textField = getTextField()
        textField.delegate = context.coordinator
        return textField
    }
    
    // FROM SwiftUI TO UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    private func getTextField() -> UITextField {
        let textfield = UITextField(frame: .zero)
        let placeholder = NSAttributedString(string: placeholder, attributes: [
            .foregroundColor : placeholderColor
            ])
        
        textfield.attributedPlaceholder = placeholder
        
        return textfield
    }
    
    func updatePlaceholder(_ text: String) -> UITextFieldViewRepresentable {
        var viewRepresentable = self
        viewRepresentable.placeholder = text
        return viewRepresentable
    }
    
    // a custom instance you use to coordinate changes from UIKit view to SwiftUI app
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    // make something that can act as a delegate..
    
    class Coordinator: NSObject, UITextFieldDelegate {
        // we need to tell SwiftUI that something changed
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            // _ refers to the binding, the property wrapper associated with this text
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            // this allows you to get the text from the text field
            // we want to send itb back to SwifTUI
            
            // When text field changes selection.,
            text = textField.text ?? ""
        }
    }
}

struct BasicUIViewRepresentable: UIViewRepresentable {
    
    // Anything from UIKit, you can build inside this function
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    

    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
}
