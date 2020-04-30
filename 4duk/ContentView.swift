//
//  ContentView.swift
//  4duk
//
//  Created by Andrey Dunaev on 07.03.2020.
//  Copyright © 2020 Andrey Dunaev. All rights reserved.
//

import SwiftUI
import AVFoundation

var player = Player()

struct ContentView: View {
    @State var playing = "play"

    var body: some View {
        Group {
            Button(action: {
                player?.toggle()
                if player!.isPlaying {
                    self.playing = "pause"
                } else {
                    self.playing = "play"
                }
            }) {
                HStack {
                    Image(systemName: "\(self.playing)")
                        .frame(width: 12, height: 12)
                    Text("4duk")
                        .fontWeight(.bold)
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(.white)
                } // HStack
                    .padding()
                    .background(Color.orange)
                    .padding(10)
                    .border(Color.orange, width: 5)
            } // Button
        } // Group
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
