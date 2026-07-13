// 
//  HighScoreModel.swift
//  Math Game
//
    

import Foundation
import SwiftData

@Model
class HighScoreModel {
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
