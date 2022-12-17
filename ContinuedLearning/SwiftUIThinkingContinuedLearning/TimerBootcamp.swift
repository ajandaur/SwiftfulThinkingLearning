//
//  TimerBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/19/22.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common)
        .autoconnect()
    
    // Current Time
    /*
     @State var currentDate: Date = Date()
     
     var dateFormatter: DateFormatter {
     let formatter = DateFormatter()
     formatter.timeStyle = .medium
     return formatter
     }
     */
    
    // Countdown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
     */
    
    // Countdown to date
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([ .minute, .second], from: Date(), to: futureDate)
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(minute) minutes, \(second) seconds"
    }
     */
    
    // Animation counter
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color.purple, Color.blue], center: .center, startRadius: 4, endRadius: 500)
                .ignoresSafeArea()
            
            HStack(spacing: 15) {
                Circle()
                    .offset(y: count == 1 ? 20: 0)
                Circle()
                    .offset(y: count == 2 ? 20: 0)
                Circle()
                    .offset(y: count == 3 ? 20: 0)
            }
            .frame(width: 200)
            .foregroundColor(.white)
        }
        .onReceive(timer, perform: { _  in
            withAnimation(.easeInOut(duration: 1.0)) {
                count = count == 3 ? 0 : count + 1
            }
        })
    }
}
    
    struct TimerBootcamp_Previews: PreviewProvider {
        static var previews: some View {
            TimerBootcamp()
        }
    }
