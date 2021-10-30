//
//  ViewController.swift
//  CalClone
//
//  Created by Kemal on 29.10.2021.
//

import UIKit


class CalClone: UIViewController {
    
    
    @IBOutlet weak var calculatorLabel: UILabel!
    
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var negativeButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var divisonButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var commaButton: UIButton!
    
    @IBOutlet weak var keypad0Button: UIButton!
    @IBOutlet weak var keypad1Button: UIButton!
    @IBOutlet weak var keypad2Button: UIButton!
    @IBOutlet weak var keypad3Button: UIButton!
    @IBOutlet weak var keypad4Button: UIButton!
    @IBOutlet weak var keypad5Button: UIButton!
    @IBOutlet weak var keypad6Button: UIButton!
    @IBOutlet weak var keypad7Button: UIButton!
    @IBOutlet weak var keypad8Button: UIButton!
    @IBOutlet weak var keypad9Button: UIButton!
    
    
    
    var previousValue:Float = 0.0
    var waitingForSecondValue = false
    var aritmethicOperationsSelection = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFunc()
        
    }
    
    
    
    @IBAction func percentButtonClicked(_ sender: Any) {
        if calculatorLabel.text != "0" {
            let floatPercent = Float(calculatorLabel.text!)! / 100
            calculatorLabel.text = String(format:"%g", floatPercent)
        }
        
    }
    
    
    @IBAction func deleteFromRight(_ sender: Any) {
        if calculatorLabel.text != "0" {
            if calculatorLabel.text!.count > 1{
                calculatorLabel.text?.popLast()
            }else{
                calculatorLabel.text = "0"
            }
        }
    }
    
    
    @IBAction func negativeButtonClicked(_ sender: Any) {
        if calculatorLabel.text != "0" {
            let number = Float(calculatorLabel.text!)!
            calculatorLabel.text = String(format: "%g", number * -1)
        }
    }
    
    @IBAction func acButtonClicked(_ sender: UIButton) {
        calculatorLabel.text = "0"
        previousValue = 0.0
        waitingForSecondValue = false
        aritmethicOperationsSelection = 4
        clearSelected(multiplyButton,minusButton,divisonButton,plusButton)
        
        
    }
    func clearSelected(_ buttons:UIButton...){
        for button in buttons{
            if button.backgroundColor == .white {
                button.backgroundColor = UIColor(#colorLiteral(red: 0.9398755431, green: 0.5829923153, blue: 0.07876548916, alpha: 1))
                button.tintColor = .white
            }
        }
    }
    @IBAction func arithmeticOperations(_ sender: UIButton) {
        if sender.tintColor == .white {
            if calculatorLabel.text != "0"{
                previousValue = Float(calculatorLabel.text!)!
                waitingForSecondValue = true
                aritmethicOperationsSelection = sender.tag
                sender.tintColor = sender.backgroundColor
                sender.backgroundColor = .white
                clearMoreSelection(sender.tag)
            }
        }else{
            waitingForSecondValue = false
            clearSelected(sender)
        }
    }
    func clearMoreSelection(_ tag:Int){
        if tag == 0 {
            clearSelected(multiplyButton,minusButton,plusButton)
        }else if tag == 1{
            clearSelected(minusButton,divisonButton,plusButton)
        }else if tag == 2 {
            clearSelected(multiplyButton,divisonButton,plusButton)
        }else if tag == 3 {
            clearSelected(multiplyButton,minusButton,divisonButton)
        }else {
            clearSelected(multiplyButton,minusButton,divisonButton,plusButton)
        }
    }
    
    @IBAction func equalButtonClicked(_ sender: Any) {
        if calculatorLabel.text != "0" && previousValue != 0{
            //Division
            if aritmethicOperationsSelection == 0 {
                let result = previousValue / Float(calculatorLabel.text!)!
                calculatorLabel.text = String(format: "%g", result)
                divisonButton.backgroundColor = divisonButton.tintColor
                divisonButton.tintColor = .white
            }
            //Multiply
            if aritmethicOperationsSelection == 1 {
                let result = previousValue * Float(calculatorLabel.text!)!
                calculatorLabel.text = String(format: "%g", result)
                multiplyButton.backgroundColor = multiplyButton.tintColor
                multiplyButton.tintColor = .white
            }
            //Minus
            if aritmethicOperationsSelection == 2 {
                let result = previousValue - Float(calculatorLabel.text!)!
                calculatorLabel.text = String(format: "%g", result)
                minusButton.backgroundColor = minusButton.tintColor
                minusButton.tintColor = .white
            }
            //Plus
            if aritmethicOperationsSelection == 3 {
                let result = previousValue + Float(calculatorLabel.text!)!
                calculatorLabel.text = String(format: "%g", result)
                plusButton.backgroundColor = plusButton.tintColor
                plusButton.tintColor = .white
            }
            //When Nothing Selected.
            if aritmethicOperationsSelection == 4 {
                //Nothing Happens here <--
            }
            aritmethicOperationsSelection = 4
        }
        
    }
    
    
    @IBAction func keypadButtons(_ sender: UIButton) {
        if waitingForSecondValue {
            calculatorLabel.text = "0"
            waitingForSecondValue = false
        }
        if sender.tag != 10 {
            if calculatorLabel.text == "0" {
                calculatorLabel.text = "\(sender.tag)"
            }else{
                calculatorLabel.text = calculatorLabel.text! + "\(sender.tag)"
            }
        }else{
            if calculatorLabel.text != "0" {
                calculatorLabel.text = calculatorLabel.text! + "."
            }
        }
        
    }
    
}

extension CalClone {
    func circleButtons (_ buttons: UIButton...){
        for button in buttons {
            button.layer.cornerRadius = button.frame.size.width / 2
            button.layer.masksToBounds = true
        }
    }
    func buttonPressedColors(_ button:UIButton,_ color:UIColor){
        
    }
    func setupFunc(){
        circleButtons(acButton,negativeButton,percentButton,divisonButton,multiplyButton,minusButton,plusButton,equalButton,commaButton,keypad1Button,keypad2Button,keypad3Button,keypad4Button,keypad5Button,keypad6Button,keypad7Button,keypad8Button,keypad9Button)
        
        keypad0Button.layer.cornerRadius = 40
    }
}

