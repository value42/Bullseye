//
//  Game.swift
//  Bullseye
//
//  Created by Александр on 16.06.2021.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 48, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference < 3 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func addToLeaderboard(score: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func startNewRound() {
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func updateScore(points: Int) {
        score += points
    }
    
    
    
    mutating func restart() {
        addToLeaderboard(score: score)
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
}
