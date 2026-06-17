//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jorge Caraballo on 5/29/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
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
                
                message = messages[messageNumber]
                messageNumber += 1
                if messageNumber == messages.count {
                    messageNumber = 0
                }
                
                imageName = "image\(imageNumber)"
                imageNumber += 1
                
                if imageNumber > 9 {
                    imageNumber = 0
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
