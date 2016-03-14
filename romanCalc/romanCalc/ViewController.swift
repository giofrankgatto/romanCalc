//
//  ViewController.swift
//  romanCalc
//
//  Created by Giovanni Gatto on 3/13/16.
//  Copyright © 2016 Giovanni Gatto. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var          outputLabel            :UILabel!
   
    
   
    var leftValue = ""
    var rightValue = ""
    var runningNumber = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    
   
    
    @IBAction func numberPressed (button: UIButton!) {
        
        runningNumber += "\(button.tag)"
        outputLabel.text = runningNumber
        
    }
    
    @IBAction func dividePressed (sender: UIButton) {
        processOperation(Operation.Divide)
        
    }
    
    @IBAction func multiplyPressed (sender: UIButton) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func subtractPressed (sender: UIButton) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func addPressed (sender: UIButton) {
        processOperation(Operation.Add)
    }
    
    @IBAction func equalPressed (sender: UIButton) {
        processOperation(currentOperation)
    }
    
    func processOperation (op: Operation) {
        if currentOperation != Operation.Empty {
            
            //if an operator is selected then another operator is selected without entering another number
            if runningNumber != "" {
            
            rightValue = runningNumber
            runningNumber = ""
            if currentOperation == Operation.Multiply {
                result = "\(Int(leftValue)! * Int(rightValue)!)"
            } else if currentOperation == Operation.Divide {
                result = "\(Int(leftValue)! / Int(rightValue)!)"
            } else if currentOperation == Operation.Subtract {
                result = "\(Int(leftValue)! - Int(rightValue)!)"
            } else if currentOperation == Operation.Add {
                result = "\(Int(leftValue)! + Int(rightValue)!)"
            }
            
            leftValue = result
            
            outputLabel.text = result
            }
            
            currentOperation = op
            
        } else {
            //This is the first time an operator has been pressed
            
            leftValue = runningNumber
            runningNumber = ""
                
            currentOperation = op
        }
        
    }
    
    @IBAction func romanNumberPressed (sender: UIButton) {
        intToRoman(Int(outputLabel.text!)!)
        
    }
    
    
    func intToRoman(num: Int) -> String {
        var romanValue = ""
        var number: Int = num
        var romanSymbolArray = ["X","IX","V","IV","I"]
        var numberValueArray = [10,9,5,4,1]
        
        
        for(var i = 0; number != 0; i++){
            while(number >= numberValueArray[i])
            {
                number -= numberValueArray[i]
                //subtract from our number the value at position i in the array
                romanValue += romanSymbolArray[i]
                //add the symbol for the value of i
            }
        }
        outputLabel.text = romanValue
        return romanValue
        
    }
    
    
    
    
    @IBAction func clearButtonPressed (sender: UIButton) {
        outputLabel.text = ""
        currentOperation = Operation.Empty
        leftValue = ""
        rightValue = ""
        result = ""
        
    }
    
    //MARK: - Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

