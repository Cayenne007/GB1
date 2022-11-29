//
//  QuestionStore.swift
//  GB1
//
//  Created by Cayenne on 28.11.2022.
//

import Foundation

class QuestionStore {
    
    static var shared = QuestionStore()
    private let careTaker = QuestionsCaretaker()
    
    private init() {}
    
    func set(_ questions: [Question]) {
        careTaker.save(questions: questions)
    }
    
    func add(_ question: Question) {
        var questions = get().filter{$0.text != question.text}
        questions.append(question)
        set(questions)
    }
    
    func del(_ question: Question) {
        let questions = get().filter{$0.text != question.text}        
        set(questions)
    }
    
    func del(title: String) {
        let questions = get().filter{$0.text != title}
        set(questions)
    }
    
    func get() -> [Question] {
        if let questions = careTaker.load() {
            return questions
        }
        
        return [
            Question(
                text: "Какая страна запустила первую межпланетную космическую станцию к Венере?",
                answers: ["СССР", "США", "Китай", "Япония"],
                correctAnswer: 0,
                cost: 50),
            Question(
                text: "Где, если верить пословице, любопытной Варваре нос оторвали?",
                answers: ["В клетке", "На улице", "На базаре", "На окошке"],
                correctAnswer: 2,
                cost: 50),
            Question(
                text: "Как назывался верховный орган власти в Древнем Риме?",
                answers: ["Сенат", "Конгресс", "Дума", "Ареопаг"],
                correctAnswer: 0,
                cost: 100),
            Question(
                text: "Как называют звезду, которая указала волхвам место рождения Христа?",
                answers: ["Кассиопея", "Орион", "Полярная", "Вифлеемская"],
                correctAnswer: 3,
                cost: 100),
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
        
    }
    
}
