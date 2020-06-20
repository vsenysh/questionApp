////
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
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
   var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
         progressBar.progress = 0.0
        
        let answerChoices = quizBrain.getAnswers()

        trueButton.setTitle(answerChoices[0], for: .normal)
        falseButton.setTitle(answerChoices[1], for: .normal)
        thirdButton.setTitle(answerChoices[2], for: .normal)
        
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        if quizBrain.checkAnswer(sender.currentTitle!){
            sender.backgroundColor = UIColor.green
            
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    
            
       
    }
    
    @objc func updateUI(){
         
          let answerChoices = quizBrain.getAnswers()
          trueButton.setTitle(answerChoices[0], for: .normal)
          falseButton.setTitle(answerChoices[1], for: .normal)
          thirdButton.setTitle(answerChoices[2], for: .normal)
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score \(quizBrain.updateScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
       
        
    }

}
