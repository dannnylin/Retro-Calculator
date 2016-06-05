//
//  ViewController.swift
//  retro-calculator
//
//  Created by Danny on 6/4/16.
//  Copyright © 2016 Danny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
        
    }
    
    var runningNumber = ""
    var leftValueStr = ""
    var rightValueStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numberPressed(btn: UIButton!) {
        runningNumber += "\(btn.tag)"
        resultLabel.text = runningNumber
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = ""
    }

    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }

    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    func processOperation(op: Operation) {
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightValueStr = runningNumber
                runningNumber = ""
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValueStr)! * Double(rightValueStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValueStr)! / Double(rightValueStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValueStr)! + Double(rightValueStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValueStr)! - Double(rightValueStr)!)"
                }
                
                leftValueStr = result
                resultLabel.text = result
            }
            
            currentOperation = op
        } else {
            leftValueStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
}

