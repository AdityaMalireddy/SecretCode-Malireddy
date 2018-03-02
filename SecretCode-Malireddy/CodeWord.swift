//
//  CodeWord.swift
//  SecretCode-Malireddy
//
//  Created by Malireddy,Aditya Jytohiswaroop on 3/1/18.
//  Copyright © 2018 Malireddy,Aditya Jytohiswaroop. All rights reserved.
//

import Foundation

class CodeWord {
    var Symbols:[String] = []
    var Count : Int = 0
    var Code : [String] = []
    var Guess : [String] = []
    var onSymbol : Int = 0
    var Attempts : Int = 1
    var Status : String = ""
    static var inst:CodeWord = CodeWord(count: 4)
    
    init(count: Int){
        
        Symbols = ["α","β","γ","δ","ε","ζ","η","θ"]
        Count = count
        for _ in 1...Count{
            Code.append(Symbols[Int(arc4random_uniform(UInt32(Symbols.count)))])
        }
        
    }
    
    func addSymbol(guessSymbol:String){
        if onSymbol < Count-1 {
            Guess.append(guessSymbol)
            onSymbol += 1
            Status = "Attempt \(Attempts): \(Guess.count) symbols guessed"
        }else if Count-1 == Guess.count {
                Guess.append(guessSymbol)
                onSymbol = 0
                Status = "Guess \(Attempts) completed: \(symbolsMatched()) correct"
            Attempts += 1
            
        }
    }
    
    
    func symbolsMatched() -> Int {
        var correct = 0;
        for i in 0 ..< Guess.count{
            if Guess[i] == Code[i] {
                correct += 1
            }
        }
        return correct
    }
    
    
    func getStatusMessage() ->String {
        return Status
    }
    
   
    func currentGuess() -> String {
        var guess = ""
        for i in 0 ..< Guess.count {
            guess += "  " + Guess[i]
        }
        return guess
    }
    
   
    func correctGuess() -> Bool {
        return symbolsMatched() == Count
    }
    
    static func getInstance() -> CodeWord{
        return inst
    }
    
    func reset(){
        Code = generateCodeWord()
        resetGuess()
        onSymbol = 0
        Attempts = 1
        Status = ""
    }
    
    func resetGuess(){
        Guess = []
    }
    
    func getSymbols() -> [String] {
        return Symbols
    }
    
    
    func undoLastGuess(){
        if Guess.count != 0 {
            Guess.removeLast()
            onSymbol -= 1
            Status = "Attempt \(Attempts): \(Guess.count) symbols guessed"
        }
    }
 

     func generateCodeWord() -> [String] {
        var w:[String] = []
        for _ in 0 ..< Count {
            let i:Int = Int(arc4random_uniform(UInt32(Symbols.count)))
            w.append(Symbols[i])
        }
        print(w)
        return w
    }
    
}
