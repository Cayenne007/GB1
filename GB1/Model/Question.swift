//
//  Question.swift
//  GB1
//
//  Created by Cayenne on 23.11.2022.
//

import Foundation

struct Question: Codable {
    let text: String
    let answers: [String]
    let correctAnswer: Int
    let cost: Int
}
