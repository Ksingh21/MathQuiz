//
//  ViewController.swift
//  MathQuiz
//
//  Created by Student on 2018-01-15.
//  Copyright © 2018 KhushwantSingh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var sign: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var answerProvided: UITextField!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    
    var randNum = 0
    var randNum1 = 0
    var randNum2 = 0
    var realAnswer = 0
    var questionCount = 0

    func setNum() {
        randNum = Int(arc4random_uniform(4))
        randNum1 = Int(arc4random_uniform(10))
        randNum2 = Int(arc4random_uniform(10))

        switch randNum {
        case 0:
            sign.text = "+"
            break
        case 1:
            sign.text = "-"
            break
        case 2:
            sign.text = "*"
            break
        case 3:
            sign.text = "/"
            break
        default:
            break
        }
        number1.text = String(randNum1)
        number2.text = String(randNum2)
    }

    func findRealAnswer() {
        if (randNum == 0) {
            realAnswer = Int(number1.text!)! + Int(number2.text!)!
        }
            else if (randNum == 1) {
                realAnswer = Int(number1.text!)! - Int(number2.text!)!
        }
            else if (randNum == 2) {
                realAnswer = Int(number1.text!)! * Int(number2.text!)!
        }
            else {
                realAnswer = Int(number1.text!)! / Int(number2.text!)!
        }

    }

    func check() {
        if (Int(realAnswer) == Int(answerProvided.text!)) {
            score.text = String(Int(score.text!)! + 1)
            round.text = String(Int(round.text!)! + 1)
            questionCount += 1
        } else {
            round.text = String(Int(round.text!)! + 1)
            questionCount += 1
        }

    }

    func displayMsg() {
        if (answerProvided.text == "") {
            let emptyAlert = UIAlertController(title: "Error", message: "Please enter a number.", preferredStyle: .alert)
            let emptyAction = UIAlertAction(title: "Okay", style: .default)
            emptyAlert.addAction(emptyAction)
            present(emptyAlert, animated: true, completion: nil)
        }
        
        if (Int(round.text!)! % 3 == 0 ) {
        let alert = UIAlertController(title: "You Got it!", message: "You Won \(score.text ?? "") out of \(questionCount) times in this Level", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        level.text = String(Int(level.text!)! + 1 )
        score.text = String(0)
        questionCount = 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNum()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkBtn(_ sender: Any) {
        findRealAnswer()
        check()
        setNum()
        displayMsg()
    }
}
