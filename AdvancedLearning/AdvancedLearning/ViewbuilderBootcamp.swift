//
//  ViewbuilderBootcamp.swift
//  AdvancedLearning
//
//  Created by Anmol  Jandaur on 2/18/23.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            if let iconName = iconName {
                Image(systemName: iconName)
            }
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}


// Initialize our view here with a CUSTOM TYPE
// Content can be anything, it is generic
struct HeaderViewGeneric<Content: View >: View {
    
    let title: String
    let content: Content
    
    
    // Add ViewBuilder and make content a closure
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        // This function will act as the closure
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            
            content
            
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
}

// All our components we use like VStack, HStack, ZStack.. They are just ViewBuilders!!!
struct CustomHStack<Content:View>:View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
    }
}

struct ViewbuilderBootcamp: View {
    var body: some View {
        
        VStack {
            HeaderViewRegular(title: "New Title", description: "hello", iconName: "heart.fill")
            
            HeaderViewRegular(title: "Another Title", description: nil, iconName: nil)
            
            // we want to be able to pass in ANY VIEW we want
            // We pass in a GENERIC VIEW
            // in this case, we pass in a Text()
            HeaderViewGeneric(title: "Generic Title") {
                // this is now our closure
                
                VStack {
                    Text("HELLO")
                    Image(systemName: "bolt.fill")
                }
                
            }
            
            CustomHStack {
                Text("HI")
                Text("HOW ARE YOU")
            }
            
            HStack {
                Text("HI")
                Text("HOW ARE YOU")
            }

            
            Spacer()
            
        }
        
        
    }
}

struct ViewbuilderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
//        ViewbuilderBootcamp()
        LocalViewBuilder(type: .three)
    }
}


struct LocalViewBuilder: View {
    
    enum ViewType {
        case one, two, three
    }
    
    let type: ViewType
    
    var body: some View {
        VStack {
            headerSection
           
        }
    }
    
    
    // Error given:
    
    // Function declares an opaque return type, but has no return statements in its body from which to infer an underlying type
    
    
    // How to solve? Put it in a stack.. HStack bc it is a ViewBuilder
    
    // But you can bypass this by making the variable an @ViewBuilder variable
    @ViewBuilder private var headerSection: some View {
        
        switch type {
        case .one:
            viewOne
        case .two:
            viewTwo
        case .three:
            viewThree
        }
    }
    
    
    private var viewOne: some View {
        Text("One!")
    }
    
    private var viewTwo: some View {
        VStack {
            Text("TWOOO")
            Image(systemName: "heart.fill")
        }
    }
    
    private var viewThree: some View {
        Image(systemName: "heart.fill")
    }
}
