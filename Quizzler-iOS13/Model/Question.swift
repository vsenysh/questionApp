//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by macbook on 2020-06-19.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text:String
    let answer:[String]
    let correctAnswer:String
    
    
    init(q:String, a:[String], correctAnswer:String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}

