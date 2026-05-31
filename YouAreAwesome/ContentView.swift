//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jorge Caraballo on 5/29/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text("I am a developer!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.red)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
