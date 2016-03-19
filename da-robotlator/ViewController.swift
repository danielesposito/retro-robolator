//
//  ViewController.swift
//  da-robotlator
//
//  Created by Daniel Esposito on 3/17/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    enum Operations: String {
        
        case Divide = "/"
        case Multiply = "*"
        case Substract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
        
    }
    
    //Outlets
    @IBOutlet weak var ledOutputLabel: UILabel!
    
    //Properties
    var btnSound: AVAudioPlayer!
    var tmpCalcNumber = ""
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    
    var currentOperation: Operations = Operations.Empty

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ledOutputLabel.text = String(0)
        
        let soundPath = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundUrl = NSURL(fileURLWithPath: soundPath!)
        
        do {
            
           try  btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
            
        } catch let err as NSError {
            
            print(err.debugDescription)
        }
        
    }
    
    
    @IBAction func onDividePressed(sender: AnyObject) {
        
        processOperation(Operations.Divide)
        
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        
        processOperation(Operations.Multiply)
        
    }

    @IBAction func onSubstractPressed(sender: AnyObject) {
        
        processOperation(Operations.Substract)
        
    }
    
    @IBAction func onAdditionPressed(sender: AnyObject) {
        
        processOperation(Operations.Add)
        
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        
        processOperation(Operations.Equals)
        
    }
    
    @IBAction func clearLedLabelPressed(btn: UIButton) {
        
        ledOutputLabel.text = "0"
    }
    
    
    @IBAction func numberPressed(btn: UIButton){
        
        playSound()

        if ledOutputLabel.text!.hasPrefix("0") && btn.tag == 0 {
            
            ledOutputLabel.text = "0"
            
            
        } else {
        
            runningNumber += "\(btn.tag)"
        
            ledOutputLabel.text = runningNumber
            
        }
    }
    

    func showSelectedNumberMessage(theTag: Int) {
        print("We selected Key \(theTag)")
    }
    
    
    func addNumberString(keypadNumber: Int) {
        
        var strKeypad = 0
        
        strKeypad += keypadNumber
        
        if ledOutputLabel.text!.hasPrefix("0") && ledOutputLabel.text!.characters.count == 1 {
            
            ledOutputLabel.text = ""
        
        }
        
        
        ledOutputLabel.text = ledOutputLabel.text! + "\(strKeypad)"
        
        leftValStr = ledOutputLabel.text!
        
    }
    
    func processOperation(op: Operations) {
        
        playSound()
        
        if currentOperation != Operations.Empty {
            
            //Run some Math
            
        } else {
            
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
            print("LeftValeString: \(leftValStr)")
    }
 
    func playSound() {
        
        if btnSound.playing {
            
            btnSound.stop()
        }
        
        btnSound.play()
    }

    
    func printPerformedAction(action: String, value: Int) {
        
        print("From \(action) Button Pressed. Left Value = \(value)")
    }
    
}

