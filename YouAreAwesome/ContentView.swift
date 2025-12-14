//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jorge Caraballo on 12/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text("I am a Developer!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
        }
        .padding()
          
    }
}

#Preview {
    ContentView()
}
