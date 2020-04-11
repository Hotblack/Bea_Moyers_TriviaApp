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

//array of Question structs
//instead of an array of Strings (like in the Town example) we will have an array of Question structs
//FORM: let Question(q: "question1", a: "answer1", q: "question2", a: "answer2")

//variable for our array index - Int
//variable for number of right answers - Int
//variable for number of wrong answers - Int
//variable to act as a flag if the user reaches the end of the quiz - Int or Boolean or String

//FUNCTION - checking the users answer
    //FORM: func function_name(user's answer (ie a String) -> returns a true or false
    //conditional statement that will return true if user's answer matches, false if not

//FUNCTION - retrieving the questions text
    //FORM: func functions_name() -> returns question (ie String)

//FUNCTION - Retrieves user's progress (question number / total number of questions)
    //FORM: func functions_name() -> returns a number (ie Float)

//FUNCTION - retrieves user's score (score right / total number of answers)
    //FORM: func functions_name -> This could a String ("this is your score...") or could just be a number (ie Float)

//FUNCTION - updates the variable that is acting as our array index (where in the index are we currently). When the user answers a question, we want to move to the next question
    //FORM: mutating func function_name()
