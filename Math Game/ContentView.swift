//
//  ContentView.swift
//  Math Game
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab(Localization.game, systemImage: "gamecontroller") {
                GameView()
            }
            Tab(Localization.scoreboard, systemImage: "list.number") {
                ScoreboardView()
            }
        }
    }
}

#Preview {
    ContentView()
}
