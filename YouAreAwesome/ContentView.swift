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
    @State private var soundName = ""
    @State private var lastImageNumber = -1 // lastMessageNumber will never be -1
    @State private var lastMessageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImages = 10 // Images labeled image0 - image9
    let numberofSounds = 5
    
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
            
            Button("Show Message") {
                let messages = ["A pájaro viejo no le sacan las plumas!",
                                "Hoy en día ya no se respeta; ni el pájaro a la escopeta!",
                                "A pájaro vivo no le falta agujero",
                                "Cada pájaro lance su canto!",
                                "Dando y dando, pajaritos volando.",
                                "Pajaro de alto vuelo!",
                                "El pajaro de tu abuelo!"]
                
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber

                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 0...numberOfImages-1)
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...numberofSounds-1)
                } while soundNumber == lastSoundNumber
                soundName = "sound\(soundNumber)"
                lastSoundNumber = soundNumber
                
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
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
