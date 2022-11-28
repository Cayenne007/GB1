//
//  Game.swift
//  GB1
//
//  Created by Cayenne on 23.11.2022.
//

import Foundation


class Game {
    
    static var shared = Game()
    
    
    //MARK: - Properties
    
    var session: GameSession?
    var score: [GameScore] = []
    var randomOrder = false
    
    
    //MARK: - Private properties
    
    private let gameCaretaker = GameCaretaker()
    
    
    //MARK: - Life circle
    
    private init() {
        guard let savedData = gameCaretaker.load() else {
            return
        }
        randomOrder = savedData.randomOrder
        score = savedData.score
    }
    
    
    //MARK: - Functions
    
    func gameOver() {
        let number = score.max{$0.number < $1.number}?.number ?? 0
        let newScore = GameScore(
            number: number+1,
            percent: session?.percentOfSucces ?? 0,
            sum: session?.collectedMoney ?? 0)
        score.append(newScore)
        gameCaretaker.save()
        session = GameSession()
    }
    
    func removeRecords() {
        score.removeAll()
        gameCaretaker.save()
    }
    
    func saveSettings() {
        gameCaretaker.save()
    }
}
