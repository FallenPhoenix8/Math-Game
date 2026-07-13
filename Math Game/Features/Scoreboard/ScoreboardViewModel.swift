//
//  ScoreboardViewModel.swift
//  Math Game
//
    
import Foundation
import SwiftData

@Observable
class ScoreboardViewModel {
    var highScores: [HighScoreModel] = []

    /// Context will be injected from the View
    var modelContext: ModelContext?
    
    func fetchHighScores() {
        guard let modelContext else { return }
        let ascendingByScoreSortDescriptor = SortDescriptor<HighScoreModel>(\.score, order: .forward)
        do {
            let descriptor = FetchDescriptor<HighScoreModel>(sortBy: [ascendingByScoreSortDescriptor])
            highScores = try modelContext.fetch(descriptor)
        } catch {
            print("Failed to fetch high scores: \(error.localizedDescription)")
        }
    }
    
    private func saveHighScores() {
        do {
            try modelContext?.save()
            fetchHighScores()
        } catch {
            print("Failed to save high score: \(error.localizedDescription)")
        }
    }
    
    func addHighScore(name: String, score: Int) {
        let model = HighScoreModel(name: name, score: score)
        modelContext?.insert(model)
        saveHighScores()
    }
    
    func updateHighScore(model: HighScoreModel, name: String) {
        model.name = name
        saveHighScores()
    }
    
    func deleteHighScore(model: HighScoreModel) {
        modelContext?.delete(model)
        saveHighScores()
    }
}
