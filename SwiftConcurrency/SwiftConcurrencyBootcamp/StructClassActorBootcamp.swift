//
//  StructClassActorBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Anmol  Jandaur on 9/27/22.
//

import SwiftUI

struct StructClassActorBootcamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                structTest2()
                classTest1()
            }
    }
}

struct StructClassActorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StructClassActorBootcamp()
    }
}

struct MyStruct {
    var title: String
}

class MyClass {
    var title: String
    
    init(title: String ) {
        self.title = title
    }
}

extension StructClassActorBootcamp  {
    
    private func runTest() {
        print("Test Started!")
    }
    
    private func structTest1() {
        let objectA = MyStruct(title: "Starting title")
        print("Object A: ", objectA.title)
        
        print("Pass the VALUES of objectA to objectB.")
        var objectB = objectA
        print("Object B: ", objectB.title)
        
        objectB.title = "Second title!"
        print("ObjectB title changed.")
        
        print("Object A: ", objectA.title)
        print("Object B: ", objectB.title)
        
    }
    
    private func classTest1() {
        let objectA = MyClass(title: "Starting title")
        print("ObjectA: ", objectA.title)
        
        let objectB = objectA
        print("Object B: ", objectB.title)
        
        objectB.title = "Second title!"
        print("ObjectB title changed.")
        
        print("Object A: ", objectA.title)
        print("Object B: ", objectB.title)
    }
}

struct CustomStruct {
    let title: String
}

extension StructClassActorBootcamp {
    
    private func structTest2() {
        print("structTest2")
        
        var struct1 = MyStruct(title: "Title1")
        print("Struct1: ", struct1.title)
        struct1.title = "Title2"
        print("Struct1:" , struct1.title)
    }
}
