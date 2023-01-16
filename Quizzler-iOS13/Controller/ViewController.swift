//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
   
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
       
        let userAnswer = sender.currentTitle!
        let rightCheck = quizBrain.checkAnswer(userAnswer)
        
        if rightCheck{
            sender.backgroundColor = UIColor.green
        }
        else
        {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
       
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(quest), userInfo: nil, repeats: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        quest()
    }

     @objc func quest (){
//        if questionNumber==3{
//            questionNumber=0
//        }
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
         scoreLabel.text = "Score: \(quizBrain.getScore())"
         
         questionLabel.text=quizBrain.questionText()
         progressBar.progress = quizBrain.questionProgress()
    }

}

