//
//  NativePopoverBootcamp.swift
//  SwiftUIPractice
//
//  Created by Anmol  Jandaur on 2/7/25.
//

import SwiftUI

struct NativePopoverBootcamp: View {
    @State private var showPopover: Bool = false
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            Button("Click ME") {
                showPopover.toggle()
            }
            .padding()
            .background(Color.yellow)
            .popover(isPresented: $showPopover, attachmentAnchor: .point(.top)) {
                Text("Hello subscribers!")
                    .presentationCompactAdaptation(.popover)
            }
        }
     
    }
}

#Preview {
    NativePopoverBootcamp()
}
