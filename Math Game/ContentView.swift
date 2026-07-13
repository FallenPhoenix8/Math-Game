//
//  ContentView.swift
//  Math Game
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Game", systemImage: "gamecontroller") {
                GameView()
            }
            Tab("Scoreboard", systemImage: "list.number") {
                ScoreboardView()
            }
        }
    }
}

#Preview {
    ContentView()
}
