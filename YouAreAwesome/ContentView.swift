//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jorge Caraballo on 5/29/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastImageNumber = -1 // lastMessageNumber will never be -1
    @State private var lastMessageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var soundIsOn = true
    let numberOfImages = 10 // Images labeled image0 - image9
    let numberOfSounds = 5
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(height: 120)
                .minimumScaleFactor(0.5)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.easeInOut(duration: 0.5), value: imageName)
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("Sound On:", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                
                Spacer()
                
                Button("Show Message") {
                    let messages = ["A pájaro viejo no le sacan las plumas!",
                                    "Hoy en día ya no se respeta; ni el pájaro a la escopeta!",
                                    "A pájaro vivo no le falta agujero",
                                    "Cada pájaro lance su canto!",
                                    "Dando y dando, pajaritos volando.",
                                    "Pajaro de alto vuelo!",
                                    "El pajaro de tu abuelo!"]
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: numberOfSounds-1)
                    if soundIsOn {
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
            }
        }
        .padding()
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
    
    func playSound(soundName: String) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
}

#Preview {
    ContentView()
}
