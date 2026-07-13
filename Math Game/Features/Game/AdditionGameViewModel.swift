//
//  AdditionGameViewModel.swift
//  Math Game
//
    
import Foundation

@Observable
class AdditionGameViewModel {
    private var gameModel: GameModel = .defaultGame
    private var problemCount = 0
    
    /// Used for determining after how many problems level should be increased
    let nextLevelBound = 5
    
    let maxIncreaseScore = 10
    
    var score: Int {
        gameModel.score
    }
    
    /// For example if: `nextLevelBound = 5`
    /// 5, 10, 15, 20, 25, 30 -> true
    /// 4, 11, 16, 18, 21, 24 -> false
    var isTimeToIncreaseLevel: Bool {
        problemCount % nextLevelBound == 0
    }
    
    var number1: Int {
        gameModel.currentProblem.number1
    }
    
    var number2: Int {
        gameModel.currentProblem.number2
    }
    
    var possibleSolutions: [Int] {
        gameModel.currentProblem.options.shuffled()
    }
    
    var answer: Int {
        gameModel.currentProblem.answer
    }
    
    var gameOver: Bool {
        gameModel.gameOver
    }
    
    func generateNextProblem() {
        // 1. Generate new problem
        gameModel.currentProblem = MathProblemModel(level: gameModel.level)
        
        // 2. Increase `problemCount`
        problemCount += 1
        
        // 3. Check if level should be increased
        if isTimeToIncreaseLevel {
            gameModel.level += 1
        }
    }
    
    private func handleCorrectAnswer() {
        gameModel.score += min(gameModel.level, maxIncreaseScore)
    }
    
    private func handleWrongAnswer() {
        gameModel.lives -= max(gameModel.lives - 1, 0)
        gameModel.score = max(gameModel.score - gameModel.level, 0)
    }
    
    func updateScore(answer: Int) {
        let isCorrect = gameModel.currentProblem.checkSolution(value: answer)
        
        if isCorrect {
            handleCorrectAnswer()
        } else {
            handleWrongAnswer()
        }
    }
    
    func reset() {
        gameModel = GameModel.defaultGame
        problemCount = 0
    }
}
