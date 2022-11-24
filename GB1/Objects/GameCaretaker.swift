//
//  RecordsCaretaker.swift
//  GB1
//
//  Created by Cayenne on 24.11.2022.
//

import Foundation

class GameCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "@millionere"
    
    func save(score: [GameScore]) {
        do {
            let data = try encoder.encode(score)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [GameScore] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([GameScore].self, from: data)
        } catch {
            return []
        }
    }
    
}
