//
//  TimesProblemGenerator.swift
//  TimesTableOX_UIKit
//
//  Created by 홍재민 on 7/1/24.
//

import Foundation

class TimesProblemGenerator {
    
    private var answer: Bool = false
    
    func getRandomExpression() -> String {
        let destNum: Int = Int.random(in: 2 ..< 10)
        let srcNum: Int = Int.random(in: 1 ..< 10)
        let result: Int = destNum * srcNum
        let randomResult: Int = Int.random(in: result - 1 ... result + 2)
        
        answer = result == randomResult
        
        let expression = "\(destNum) X \(srcNum) = \(randomResult)"
        return expression
    }
    
    func checkAnswer(value: Bool) -> Bool {
        return value == answer
    }
}
