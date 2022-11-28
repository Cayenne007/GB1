//
//  GameSession.swift
//  GB1
//
//  Created by Cayenne on 23.11.2022.
//

import Foundation

class GameSession: GameViewControllerDelegate {
    
    //MARK: - Properties
    
    var currentQuestion = 0
    var title: String {
        "Вопрос \(currentQuestion+1)"
    }
    var text: String {
        question.text
    }
    var costTitle: String {
        "Стоимость вопроса: \(question.cost)"
    }
    var answers: [String] {
        question.answers
    }
    var questionsCount: Int {
        questions.count
    }
    var percentOfSucces: Int {
        Int(Double(currentQuestion + 1) / Double(questionsCount) * 100.0)
    }
    
    var collectedMoney = 0
    var moneyTitle: String {
        "Накоплено денег: \(collectedMoney)"
    }
    

    //MARK: - Private properties
    
    private var questions: [Question] = []
    private var question: Question {
        questions[currentQuestion]
    }
    
    
    //MARK: - Life circle
    
    init() {
        var strategy: QuestionOrderStrategy
        strategy = Game.shared.randomOrder ? QuestionRandomOrder() : QuestionDirectOrder()
        questions = strategy.getQuestions()
    }
    
    
    //MARK: - functions
    
    func confirm(tag: Int) -> GameResult {
        if question.correctAnswer == tag {
            if currentQuestion == (questionsCount-1) {
                Game.shared.gameOver()
                return .gameOver
            } else {
                collectedMoney += question.cost
                currentQuestion += 1
                return .correctAnswer
            }
        } else {
            Game.shared.gameOver()
            return .gameOver
        }
    
    }
    
    
}

enum GameResult {
    case correctAnswer
    case gameOver
}
