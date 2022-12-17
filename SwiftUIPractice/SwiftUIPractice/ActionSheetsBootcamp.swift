//
//  ActionSheetsBootcamp.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 12/29/21.
//

import SwiftUI

struct ActionSheetsBootcamp: View {
    
    @State var showActionSheet: Bool = false
    
    var body: some View {
        Button("Click me") {
            showActionSheet.toggle()
        }
        .actionSheet(isPresented: $showActionSheet, content: {
            ActionSheet(title: Text("This is the title!"))
        })
    }
    
    func getActionSheet() -> ActionSheet {
       // return ActionSheet(title: Text("This is the title!"))
        
        let button1: ActionSheet.Button = .default(Text("DEFAULT"))
        let button2: ActionSheet.Button = .destructive(Text("DESTRUCTIVE"))
        let button3: ActionSheet.Button = .cancel()
        return ActionSheet(title: Text("This is the title"),
                           message: nil,
                           buttons: [button1, button2, button3])
    }
}

struct ActionSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetsBootcamp()
    }
}
