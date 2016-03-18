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
        
        if leftValStr.characters.count > 0 {
            
            print("From Divider Action: \(leftValStr)")
            
            ledOutputLabel.text = ""

        }
        
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
        
//        switch btn.tag {
//        case 0:
//            showSelectedNumberMessage(btn.tag)
//            addNumberString(btn.tag)
//        case 1:
//            showSelectedNumberMessage(btn.tag)
//            addNumberString(btn.tag)
//        case 2:
//            showSelectedNumberMessage(btn.tag)
//            addNumberString(btn.tag)
//        case 3:
//            showSelectedNumberMessage(btn.tag)
//            addNumberString(btn.tag)
//        case 4:
//            showSelectedNumberMessage(btn.tag)
//            addNumberString(btn.tag)
//        case 5:
//            showSelectedNumberMessage(btn.tag)
//            addNumberString(btn.tag)
//        case 6:
//            showSelectedNumberMessage(btn.tag)
//            addNumberString(btn.tag)
//        case 7:
//            showSelectedNumberMessage(btn.tag)
//            addNumberString(btn.tag)
//        case 8:
//            showSelectedNumberMessage(btn.tag)
//            addNumberString(btn.tag)
//        case 9:
//            showSelectedNumberMessage(btn.tag)
//            addNumberString(btn.tag)
//
//        default: break
//            
//        }
        
        addNumberString(btn.tag)
        
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
        
        print("LeftValeString: \(leftValStr)")
        
        
    }
    
    func processOperation(op: Operations) {
        
        playSound()
        
    }
 
    func playSound() {
        
        if btnSound.playing {
            
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
}

