//
//  MathProblemModel.swift
//  Math Game
//
    
import Foundation

struct MathProblemModel: Identifiable {
    let id = UUID()
    let number1: Int
    let number2: Int
    let level: Int
    
    /// `options[0]` is the solution
    /// the other options are distractions
    let options: [Int]
    var answer: Int {
        options[0]
    }
    
    func checkSolution(value: Int) -> Bool {
        !options.isEmpty && value == answer
    }
    
    init(level: Int) {
        self.level = level
        let lower = (level - 1) * 5
        let upper = level * 5
        
        self.number1 = Int.random(in: lower...upper)
        self.number2 = Int.random(in: lower...upper)
        
        self.options = Self.generateOptions(num1: number1, num2: number2)
    }
    
    private static func generateOptions(num1: Int, num2: Int) -> [Int] {
        var options: [Int] = []
        
        let solution = num1 + num2
        options.append(solution)
        
        let decimalConfusingAnswer = solution + 10
        options.append(decimalConfusingAnswer)
        
        let belowAnswer = max(1, solution - 5)
        options.append(Int.random(in: belowAnswer ..< solution))
        
        let aboveAnswer = min(10, solution + 5)
        options.append(Int.random(in: (solution + 1)...aboveAnswer))
        
        return options
    }
}
