//
//  GameSession.swift
//  GB1
//
//  Created by Cayenne on 23.11.2022.
//

import Foundation

class GameSession: GameViewControllerDelegate {
    
    //MARK: - Properties
    
    var questionIndex = Observable<Int>(0)
    
    var title: String {
        "Вопрос \(questionIndex.value + 1)"
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
        Int(Double(questionIndex.value) / Double(questionsCount) * 100.0)
    }
    
    var collectedMoney = 0
    var moneyTitle: String {
        if percentOfSucces == 0 {
            return "Накоплено денег: \(collectedMoney)"
        } else {
            return "Накоплено денег: \(collectedMoney) (\(percentOfSucces)%)"
        }
    }
    

    //MARK: - Private properties
    
    private var questions: [Question] = []
    private var question: Question {
        questions[questionIndex.value]
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
            
            collectedMoney += question.cost
            
            if questionIndex.value == (questionsCount - 1) {
                questionIndex.value += 1
                Game.shared.gameOver()
                return .gameOver
            } else {
                questionIndex.value += 1
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
