//
//  ViewController.swift
//  TriviaApp
//
//  Created by Adam Jackrel on 4/8/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var number : Float = 0.0
    
    @IBOutlet var progressBar: UIView!
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var player : AVAudioPlayer?

    var myQuizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        // THIS FUNCTION ALWAYS RUNS WHEN THE APP LOADS
        //VERY SIMILIAR TO SETUP() IN PROCESSING
        //THIS IS WHERE WE WILL CALL/ACTIVATE OUR CUSTOM FUNCTION, UPDATEUI()
        //UPDATEUI WILL SETUP EVERYTHING FOR THE REST OF THE CODE TO WORK
        number = number + 0.1
        progressBar.progress = number
         playSound(label: TrumpetSound)
    }
    
    //UPDATEUI WILL UPDATE ANY ON SCREEN ELEMENTS AS WELL AS SETUP EVERYTHING FOR OUR FIRST PLAY THROUGH
  
    
    
    
    func playSound() {
      guard let url = Bundle.main.url(forResource: label, withExtension: "wav") else { return }
      do {
          try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
          try AVAudioSession.sharedInstance().setActive(true)
          player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

          guard let player = player else { return }
          player.play()
      } catch let error {
          print(error.localizedDescription)
      }
  }
    
    
    
    @objc func updateUI(){
        
        questionLabel.text = myQuizBrain.retriveQuestion()
        scoreLabel.text = String(myQuizBrain.retrieveScore())
        myQuizBrain.endQuiz() 

            
        
        //CLEAR ANY COLOR CHANGES (FOR INSTANCE, IF THE COLOR CHANGES WHEN USER GETS QUESTION RIGHT/WRONG, WE WANT THE COLOR TO CHANGE BACK AFTER THEY ANSWER THE QUESTION
        
        //UPDATE THE PROGRESS BAR
        
        //UPDATE THE QUESTION THAT APPEARS ON SCREEN
        
      
        
        
        //CONDITIONAL THAT WILL CHECK IF THE QUIZ IS OVER. SOME KIND ON SCREEN FEEDBACK SHOULD HAPPEN AT THIS POINT. DISPLAY SCORE, CONGRATULATE THE PLAYER, ETC
        
        
    }
    
    //IBACTION FUNCTION (TRUE AND FALSE BUTTONS SHOULD BE LINKED TO THIS FUNCTION)
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var answer = sender.currentTitle!
        
        var chosenAnswer = myQuizBrain.checkAnswer (answer: answer)
       
        if (arrayIndex>19) {
        var answer = "You're done!"
        }
        
        
        
        if chosenAnswer == true {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
       
        sender.alpha = 0.5
           //Code should execute after 0.2 second delay.
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
           //Bring's sender's opacity back up to fully opaque.
           sender.alpha = 1.0
       
        
    }
    }
}
   
    
            //STORE THE CURRENTTITLE OF THE BUTTON IN A VARIABLE
    
            //CHECK THE ANSWER USING QUIZBRAIN
    
            //CONDITIONAL STATEMENT THAT WILL:
                //CHANGE THE BUTTONS COLOR DEPENDING IF THEY GOT IT RIGHT OR WRONG
                //UPDATE THE SCORE VARIABLES
                //INFORM THE USER IF THEY GOT IT RIGHT OR WRONG
            
            //USE A TIMER TO CALL UPDATEUI() TO CHANGE ON SCREEN ELEMENTS (UPDATE QUESTION TEXT, PROGRESS, SCORE, ETC). ITS A GOOD IDEA TO USE A TIMER SO WE CAN CONTROL HOW LONG THE COLOR CHANGES. EXAMPLE: USER PRESSES THE BUTTON->BUTTON COLOR CHANGES->TIMER FOR # OF SECONDS->CALL UPDATEUI() USING TIMER. REVIEW MUSICAPP FOR MORE REVIEW
    
            //GO TO THE NEXT QUESTION



