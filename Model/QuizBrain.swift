//
//  File.swift
//  TriviaApp
//
//  Created by Adam Jackrel on 4/8/20.
//  Copyright © 2020 Adam Jackrel. All rights reserved.
//

//this struct will be the heart of the question bank
//it contains two fields, and no functions
//only serving to be the "question/answer" part of the code
struct Question {
    
    //two fields for qustions and answers
    //both declared as Strings, since nothing else will be in there
    var text: String
    var answer: String
    
    //our init function will initialize the two fields with whatever
    init(q: String, a: String) {
        text = q;
        answer = a;
    }
    
}

import Foundation

//begin struct
struct QuizBrain{
    
    let Quiz = {
        [Question(q: "Paying living wages to garment workers would cause a huge increase in the average retail price of a piece of clothing.", a: "False"),
        Question(q: "Over 50% of workers within the fashion industry are not paid the minimum wage in countries like India and the Philippines.", a: "True"),
        Question(q: "In most of the manufacturing countries, the minimum wage represents between half and a fifth of the living wage.", a: "True"),
        Question(q: "Garment workers often work 14 to 16 hours a (qday, 7 days a week.", a: "True"),
        Question(q: "Garment workers usually work with no ventilation, breathing in toxic substances.", a: "True"),
        Question(q: "50 million children in the world are forced to work.", a: "False"),
        Question(q: "In Uzbekistan, one of the world’s largest cotton producers, the government takes children out of school to pick cotton.", a: "True"),
        Question(q: "In most factories where our clothes are produced, garment workers are not allowed to form unions to defend their rights collectively.", a: "True"),
        Question(q: "More than 2% of clothes bought in American were made in America.", a: "False"),
        Question(q: "Garment workers regularly face verbal and physical abuse.", a: "True"),
        Question (q:"About 4 million children are in forced labor.", a: "False"),
        Question (q: "While people bought 60% more garments in 2014 than in 2000, they only kept each garment for half as long.", a: "True"),
        Question (q: "Big brands like Forever 21 refuse to source clothing from factories that exploit workers.", a: "False" ),
        Question (q: "International flights cause more pollution than the fashion industry does.", a: "False"),
        Question(q: "Most of Uniqlo’s products are made in China where the employees have to work under terrible conditions such as low pay, long hours and horrific working treatment.", a: "True" ),
        Question(q: "The raw material used to make the clothing of Victoria’s Secret comes from cotton handpicked by children.", a: "True"),
        Question(q: "The 2013 Rana Plaza factory collapse killing over 1,100 workers caused most large fashion companies to reassess the way that they source their products. ", a: "False"),
        Question(q: "The entire European Union emits more greenhouse gases than the apparel and footwear industry.", a:"False"),
        Question(q: "Tiny plastic microfibers, shed by synthetic garments during laundry, are inundating our water supply and food chain.", a: "True"),
        Question(q: "Over 50% of fast fashion produced is disposed of in under a year.", a: "True" )]
    }
    var arrayIndex : Int = 0
    var scoreRight : Int = 0
    var endOfQuiz : Bool = false
    
    func checkAnswer (answer: String)-> Bool {
        if (answer == Quiz()[arrayIndex].answer){
            return true
        }
        else {
            return false
        }
    }
    
    func retriveQuestion() -> String {
        return (Quiz()[arrayIndex].text)
    }
    func progress () -> Float {
        return Float (arrayIndex/20)
    }
    func retrieveScore() -> Int {
        return Int (scoreRight)
    }
    
    mutating func endQuiz (){
        arrayIndex  = arrayIndex + 1
        if (arrayIndex > 19){
           arrayIndex = 0
        }
    }
    
//array of Question structs
//instead of an array of Strings (like in the Town example) we will have an array of Question structs
//FORM: let quiz = [Question(q: "question", a: "answer"), Question(q: "questions", a: "answer")]
   
    
//variable for our array index - Int
//variable for number of right answers - Int
//variable for number of wrong answers - Int
//variable to act as a flag if the user reaches the end of the quiz - Int or Boolean or String

//FUNCTION - checking the users answer. This will check if the String sent from the ViewController (ie, the user's answer) matches the String from the array of Question structs (ie, the answer)
    //FORM: func function_name(user's answer (ie a String) -> returns a true or false
    //conditional statement that will return true if user's answer matches, false if not

//FUNCTION - retrieving the questions text from the array of Question structs
    //FORM: func functions_name() -> returns question (ie String)

//FUNCTION - Retrieves user's progress (question number / total number of questions)
    //FORM: func functions_name() -> returns a number (ie Float)

//FUNCTION - retrieves user's score (score right / total number of answers)
    //FORM: func functions_name -> This could a String ("this is your score...") or could just be a number (ie Float)

//FUNCTION - updates the variable that is acting as our array index (we need a "pointer" that will keep track of where in the array we are). Useful for knowing what question we're on and when the quiz is over.
    //FORM: func function_name()

}
