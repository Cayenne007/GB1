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
    
    func save() {
        let dataToSave = GameCare(randomOrder: Game.shared.randomOrder,
                                  score: Game.shared.score)
        do {
            let data = try encoder.encode(dataToSave)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> GameCare? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            let gameCare = try decoder.decode(GameCare.self, from: data)
            return gameCare
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}

struct GameCare: Codable {
    var randomOrder: Bool
    var score: [GameScore]
}
