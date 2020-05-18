//
//  ViewController.swift
//  TriviaApp
//
//  Created by Adam Jackrel on 4/8/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//


//------------------------------------------------------

//TEACHERS FEEDBACK

//DESIGN: LOVE THE DESIGN. VERY COLORFUL, BRIGHT, EASY TO READ AND FRIENDLY
//DESIGN FIXES: THE QUESTION LABEL IS SET TO A VERY LARGE FONT SIZE. REDUCED BY 50% AND IT WORKS GREAT
//RESEARCH: EXCELLENT QUESTIONS - GREAT RESEARCH AND EYE OPENING FACTS!
//RESEARCH FIX: BE SURE TO INCLUDE CITATIONS, ACKS, AND AUTHORSHIP! VERY VERY VERY IMPORTANT!!!!
//CODE: NEARLY GOT EVERYTHING! YOU WERE MISSING SOME PARTS, BUT I VERY MUCH APPRECIATE THE EFFORT YOU PUT INTO THE PROJECT. YOU LEARNED SO MUCH ABOUT PROGRAMMING DOING THIS PROJECT SO I HOPE YOU FEEL YOUR EFFORTS WERE WORTH IT!
//CODE FIXES. TO FIX THE CODE YOU CAN DO THE FOLLOWING:

//--------------YES, THERES SOME PROBLEMS. SOME EASY TO SOLVE, SOME DIFFICULT.------------------
//--------------READ THROUGH MY COMMENTS AND LOOK AT THE CODE I CHANGED-------------------

//THERE WAS A SMALL PROBLEM WITH THE LINK FROM THE STORYBOARD TO THE VIEW CONTROLLER. THE STORYBOARD SHOULD ALWAYS BE NAMED 'VIEW' AND BE LINKED THE VIEW CONTROLLER. YOUR STORYBOARD WAS NAMED 'progressBar' AND THUS WAS NOT BEING LINKED TO THE VIEW CONTROLLER
//USING A VARIABLE WITH A CAPITAL LETTER IS NEVER ADVISED. ALL VARIABLES SHOULD BEGIN WITH A LOWER CASE LETTER. INSIDE OF QUIZBRAIN() THE ARRAY 'Quiz' SHOULD HAVE BEEN NAMED 'quiz'. THIS BUG CREATED OTHER PROBLEMS, THUS IT IS WHY CHECKANSWER() AND ENDQUIZ() WOULD NOT FUNCTION PROPERLY
//QUIZ ARRAY HAD EXTRA CURLY BRACKETS AROUND THE ARRAY. ARRAYS DO NOT USE CURLY BRACKETS. NOR THE KEY:VALUE PAIRS INSIDE THE ARRAY
//CHECKANSWER() WAS MATCHING IF THE BUTTON'S NAME MATCHED THE ANSWER VALUE INSIDE THE ARRAY. THE TRUE AND FALSE BUTTONS ARE NAMED, 'TRUE' AND 'FALSE'...HOWEVER, THE ANSWER VALUE INSIDE THE ARRAY IS NAMED, 'True' AND 'False'. EVEN DIFFERENCES IN CASE MAKE A DIFFERENCE
//ONLY THE TRUE BUTTON WAS REFERENCED INSIDE OF UPDATEUI(), THUS ONLY ONE BUTTON WOULD REVERT BACK TO ITS ORIGINAL COLOR
//CHECKING FOR THE END OF THE QUIZ MUST HAPPEN AT THE RIGHT POINT. THE ARRAYINDEX WAS UPDATING PAST THE CHECEK IN UPDATEUI. USED ENDOFQUIZ INSIDE OF QUIZBRAIN TO DETERMINE WHEN THE ARRAYINDEX WAS AT 19 THEN USED THAT AS A FLAG DURING THE CHECK INSIDE OF UPDATEUI
//PROGRESS BAR MUST ONLY TAKE A FLOAT. IF YOU DIVIDE TWO INTS YOU GET ANOTHER INT. IF YOU WANT TO DIVIDE TWO INTS AND SAVE IT AS A FLOAT, THEN CAST/CONVERT THE INTS TO FLOATS BEFORE DIVISION AND STORE THE RESULTING VALUE INSIDE OF A FLOAT VARIABLE
//------------------------------------------------------


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var number : Float = 0.0
    
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    var player : AVAudioPlayer!

    var myQuizBrain = QuizBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       updateUI()
        // THIS FUNCTION ALWAYS RUNS WHEN THE APP LOADS
        //VERY SIMILIAR TO SETUP() IN PROCESSING
        //THIS IS WHERE WE WILL CALL/ACTIVATE OUR CUSTOM FUNCTION, UPDATEUI()
        //UPDATEUI WILL SETUP EVERYTHING FOR THE REST OF THE CODE TO WORK
    }
    
    @objc func updateUI(){
        print("updateUI")
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear


        //number = number + 0.1
        progressView.progress = myQuizBrain.progress()
        myQuizBrain.endQuiz()
        //myQuizBrain.arrayIndex
       
        
        questionLabel.text = myQuizBrain.retrieveQuestion()
        scoreLabel.text = String(myQuizBrain.retrieveScore())
        
        if (myQuizBrain.endOfQuiz == true){
            print("here")
            print(myQuizBrain.arrayIndex)
            questionLabel.text = "You're done!"
            playSound(label: "TrumpetSound")
            myQuizBrain.arrayIndex = 0
       
        }

    }

        
    
    @IBAction func buttonPressed(_ sender: UIButton) {
       
      //  timer.invalidate()
       
        var answer = sender.currentTitle!
        
        var chosenAnswer = myQuizBrain.checkAnswer (answer: answer)
       

    
        if chosenAnswer == true {
            print("CORRECT")
            sender.backgroundColor = UIColor.green
             myQuizBrain.scoreRight += 1
        }
        else {
            print("NOT CORRECT")
            sender.backgroundColor = UIColor.red
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: false)
       
        sender.alpha = 0.5
           //Code should execute after 0.2 second delay.
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
           //Bring's sender's opacity back up to fully opaque.
           sender.alpha = 1.0
       
        
    }
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        myQuizBrain.arrayIndex = 0
    }
    
  
    func playSound(label: String) {
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
  
  
}

   
    
            //STORE THE CURRENTTITLE OF THE BUTTON IN A VARIABLE
    
            //CHECK THE ANSWER USING QUIZBRAIN
    
            //CONDITIONAL STATEMENT THAT WILL:
                //CHANGE THE BUTTONS COLOR DEPENDING IF THEY GOT IT RIGHT OR WRONG
                //UPDATE THE SCORE VARIABLES
                //INFORM THE USER IF THEY GOT IT RIGHT OR WRONG
            
            //USE A TIMER TO CALL UPDATEUI() TO CHANGE ON SCREEN ELEMENTS (UPDATE QUESTION TEXT, PROGRESS, SCORE, ETC). ITS A GOOD IDEA TO USE A TIMER SO WE CAN CONTROL HOW LONG THE COLOR CHANGES. EXAMPLE: USER PRESSES THE BUTTON->BUTTON COLOR CHANGES->TIMER FOR # OF SECONDS->CALL UPDATEUI() USING TIMER. REVIEW MUSICAPP FOR MORE REVIEW
    
            //GO TO THE NEXT QUESTION



