//
//  QuestionsCaretaker.swift
//  GB1
//
//  Created by Cayenne on 28.11.2022.
//

import Foundation

class QuestionsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private var url: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            .appending(path: "questions.json")
    }
    
    
    func save(questions: [Question]) {
        do {
            let data = try encoder.encode(questions)
            try data.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [Question]? {
        do {
            let data = try Data(contentsOf: url)
            let questionCare = try decoder.decode([Question].self, from: data)
            return questionCare
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}
