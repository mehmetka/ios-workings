//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by mehmetka on 1.11.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], ca: String) {
        text = q
        answers = a
        correctAnswer = ca
    }
}
