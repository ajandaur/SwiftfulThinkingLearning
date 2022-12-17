//
//  Sheets.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 12/28/21.
//

import SwiftUI

struct Sheets: View {
    @State var showSheet = false
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))

            })
                .sheet(isPresented: $showSheet, content: {
                    SecondScreen()
                })
            
        }
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)

            })
              
            
        }
    }
}

struct Sheets_Previews: PreviewProvider {
    static var previews: some View {
        Sheets()
    }
}
