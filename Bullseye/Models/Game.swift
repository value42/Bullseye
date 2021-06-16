//
//  Game.swift
//  Bullseye
//
//  Created by Александр on 16.06.2021.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        var difference: Int = self.target - sliderValue
        if difference < 0 {
            difference *= -1
        }
        var awardedPoints: Int = 100 - difference
        return awardedPoints
    }
}
