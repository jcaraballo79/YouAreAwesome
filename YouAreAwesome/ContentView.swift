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
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            Button("Press Me!") {
                let messageOne = "You Are Awesome!"
                let messageTwo = "You Are Great!"
                let imageNameOne = "hand.thumbsup"
                let imageNameTwo = "sun.max.fill"
                
                if message == messageOne {
                    message = messageTwo
                    imageName = imageNameTwo
                } else {
                    message = messageOne
                    imageName = imageNameOne
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
