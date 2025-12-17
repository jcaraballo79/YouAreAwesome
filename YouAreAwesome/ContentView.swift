//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jorge Caraballo on 12/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageString = ""
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(systemName: imageString)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let imageString1 = "sun.max.fill"
                let imageString2 = "hand.thumbsup"
                
//                if message == message1 {
//                    message = message2
//                    imageString = imageString1
//                } else {
//                    message = message1
//                    imageString = imageString2
//                }
                
// Ternary Operator
                message = (message == message1 ? message2 : message1)
                imageString = (message == message1 ? imageString2 : imageString1)
                
            }
        }
        .padding()
        .buttonStyle(.borderedProminent)
        .font(.title2)
        .tint(.orange)
    }
}
#Preview {
    ContentView()
}

