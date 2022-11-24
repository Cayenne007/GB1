//
//  Game.swift
//  GB1
//
//  Created by Cayenne on 23.11.2022.
//

import Foundation

class Game {
    
    static var shared = Game()
    
    var session: GameSession?
    
    let questions: [Question]
    
    var score: [GameScore]
    
    private let gameCaretaker = GameCaretaker()
    
    func gameOver() {
        let number = score.max{$0.number < $1.number}?.number ?? 0
        let newScore = GameScore(number: number+1, sum: session?.collectedMoney ?? 0)
        score.append(newScore)
        gameCaretaker.save(score: score)
        session = GameSession()
    }
    
    func removeRecords() {
        score.removeAll()
        gameCaretaker.save(score: score)
    }
    
    
    private init() {
        questions = [
            Question(
                text: "Какая страна запустила первую межпланетную космическую станцию к Венере?",
                answers: ["СССР", "США", "Китай", "Япония"],
                correctAnswer: 0,
                cost: 100),
            Question(
                text: "Где, если верить пословице, любопытной Варваре нос оторвали?",
                answers: ["В клетке", "На улице", "На базаре", "На окошке"],
                correctAnswer: 2,
                cost: 100),
            Question(
                text: "Как называют звезду, которая указала волхвам место рождения Христа?",
                answers: ["Кассиопея", "Орион", "Полярная", "Вифлеемская"],
                correctAnswer: 3,
                cost: 200),
            Question(
                text: "Какой знак восточного гороскопа следует за знаком Дракона?",
                answers: ["Змея", "Тигр", "Мышь", "Конь", "Рысь"],
                correctAnswer: 0,
                cost: 200),
            Question(
                text: "Как называется боязнь глубины?",
                answers: ["Пустомония", "Батофобия", "Психрофобия", "Астрафобия"],
                correctAnswer: 1,
                cost: 200),
            Question(
                text: "Сколько стран входит в состав Великобритании?",
                answers: ["1", "2", "3", "4", "5"],
                correctAnswer: 3,
                cost: 500),
            Question(
                text: "Сколько процентов из жизни ленивцы проводят во сне?",
                answers: ["50%", "75%", "100%", "150%"],
                correctAnswer: 1,
                cost: 500),
                    ]
        self.score = gameCaretaker.load()
        self.session = GameSession()
    }
    
}
