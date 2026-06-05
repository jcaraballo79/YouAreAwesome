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
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
            
            Spacer()
            
            Button("Press Me!") {
                let messageOne = "You Are Awesome!"
                let messageTwo = "You Are Great!"
                
                message = (message == messageOne ? messageTwo : messageOne)
                imageName = (imageName == "image0" ? "image1" : "image0")

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
