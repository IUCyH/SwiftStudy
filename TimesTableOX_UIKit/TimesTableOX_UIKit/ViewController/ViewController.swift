//
//  ViewController.swift
//  TimesTableOX_UIKit
//
//  Created by 홍재민 on 7/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    var problemCount: Int = 1
    var correctCount: Int = 0
    var incorrectCount: Int = 0
    
    let popupVC = PopupVC()
    let timesProblemGenerator = TimesProblemGenerator()

    @IBOutlet weak var expressionLabel: UILabel!
    @IBOutlet weak var problemCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initGame()
    }
    
    @IBAction func correctButtonAction() {
        problemCount += 1
        
        updateAccuracy(answer: true)
        
        if canContinueGame() {
            updateProblemView()
        } else {
            popupVC.openPopup(viewController: self, totalCorrectCount: correctCount, totalIncorrectCount: incorrectCount, closeEvent: initGame)
        }
    }
    
    @IBAction func incorrectButtonAction() {
        problemCount += 1
        
        updateAccuracy(answer: false)
        
        if canContinueGame() {
            updateProblemView()
        } else {
            popupVC.openPopup(viewController: self, totalCorrectCount: correctCount, totalIncorrectCount: incorrectCount, closeEvent: initGame)
        }
    }
    
    func initGame() {
        correctCount = 0
        incorrectCount = 0
        problemCount = 1
        
        updateProblemView()
    }
    
    func setLabelTitle(label: UILabel, title: String) {
        label.text = title
    }
    
    func updateAccuracy(answer: Bool) {
        guard timesProblemGenerator.checkAnswer(value: answer) else {
            incorrectCount += 1
            return
        }
        
        correctCount += 1
    }
    
    func canContinueGame() -> Bool {
        return problemCount < 11
    }
    
    func updateProblemView() {
        let expression: String = timesProblemGenerator.getRandomExpression()
        
        setLabelTitle(label: expressionLabel, title: expression)
        setLabelTitle(label: problemCountLabel, title: "Problem \(problemCount) / 10")
    }
}

