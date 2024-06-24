//
//  ViewController.swift
//  ClosureCalculater
//
//  Created by 홍재민 on 6/18/24.
//

import UIKit

class Calculater {
    func add(dest: Int, src: Int) -> Int {
        dest + src
    }
}

class ViewController: UIViewController {
    let calc: Calculater = Calculater()
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAllLabels()
    }
    
    @IBAction func addAndDisplayResult() {
        let result: Int = calc.add(dest: firstNumber, src: secondNumber)
        
        updateLabel(label: resultLabel, value: "\(result)")
    }

    @IBAction func increaseFirstNumber() {
        firstNumber += 1
        
        updateLabel(label: firstNumberLabel, value: "\(firstNumber)")
    }
    
    @IBAction func decreaseFirstNumber() {
        firstNumber -= 1
        
        updateLabel(label: firstNumberLabel, value: "\(firstNumber)")
    }
    
    @IBAction func increaseSecondNumber() {
        secondNumber += 1
        
        updateLabel(label: secondNumberLabel, value: "\(secondNumber)")
    }
    
    @IBAction func decreaseSecondNumber() {
        secondNumber -= 1
        
        updateLabel(label: secondNumberLabel, value: "\(secondNumber)")
    }
    
    func updateLabel(label: UILabel, value: String) {
        label.text = "\(value)"
    }
    
    func initAllLabels() {
        updateLabel(label: firstNumberLabel, value: "\(firstNumber)")
        updateLabel(label: secondNumberLabel, value: "\(secondNumber)")
        updateLabel(label: resultLabel, value: "\(0)")
    }
}

