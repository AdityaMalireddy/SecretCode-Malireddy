//
//  ViewController.swift
//  SecretCode-Malireddy
//
//  Created by Malireddy,Aditya Jytohiswaroop on 3/1/18.
//  Copyright © 2018 Malireddy,Aditya Jytohiswaroop. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    
    @IBOutlet weak var GuessLBL: UILabel!
    
    @IBOutlet weak var StatusLBL: UILabel!
    
   
    
    @IBAction func UndoACT(_ sender: Any) {
        if AppDelegate.code.Guess.count != 0 {
            AppDelegate.code.undoLastGuess()
            GuessLBL.text = "The Guess : "+AppDelegate.code.currentGuess()
            StatusLBL.text = AppDelegate.code.getStatusMessage()
        }
    }
    
    @IBAction func ResetACT(_ sender: Any) {
        AppDelegate.code.reset()
        GuessLBL.text = ""
        StatusLBL.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.code.Symbols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableview")!
        cell.textLabel?.text = AppDelegate.code.Symbols[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppDelegate.code.addSymbol(guessSymbol: AppDelegate.code.Symbols[indexPath.row])
        
        GuessLBL.text = "The Guess : "+AppDelegate.code.currentGuess()
        StatusLBL.text = AppDelegate.code.getStatusMessage()
        if AppDelegate.code.Guess.count == AppDelegate.code.Code.count {
            AppDelegate.code.Guess = []
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose from below.."
    }

}

