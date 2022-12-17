//
//  SoundsBootcamp.swift
//  SwiftUIThinkingContinuedLearning
//
//  Created by Anmol  Jandaur on 5/3/22.
//

import SwiftUI
import AVKit

class SoundManager: ObservableObject {
    
    // create a singleton - create it once for the entire application instead of trying to create a new one on each screen
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "Tada-sound", withExtension: ".mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {
    
    var soundManager = SoundManager()
    
    var body: some View {
        VStack (spacing: 40){
            Button("Play sound 1") {
                SoundManager.instance.playSound()
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
