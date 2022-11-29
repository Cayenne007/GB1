//
//  QuestionOrderStrategy.swift
//  GB1
//
//  Created by Cayenne on 27.11.2022.
//

import Foundation

protocol QuestionOrderStrategy {
    func getQuestions() -> [Question]
}

class QuestionRandomOrder: QuestionOrderStrategy {
    func getQuestions() -> [Question] {
        QuestionStore.shared.get().shuffled()
    }
}

class QuestionDirectOrder: QuestionOrderStrategy {
    func getQuestions() -> [Question] {
        QuestionStore.shared.get()
    }
}
