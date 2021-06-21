//
//  CalculateViewController.swift
//  Demo002
//
//  Created by lean on 2021/6/18.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var numberOnScreen: Double = 0 //在畫面顯示的數字
    var previousNumber: Double = 0 //在運算之前的數字
    var performingMath = false    //是否現在正在運算
    var operation: OperationType = .none
    var startNew = true
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBOutlet var textLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber = sender.tag - 1
        if textLabel.text != nil{
            if startNew == true{
                textLabel.text = "\(inputNumber)"
                startNew = false
            }else{
            if textLabel.text == "0" || textLabel.text == "+" || textLabel.text == "-" || textLabel.text == "x" || textLabel.text == "/"{
                textLabel.text = "\(inputNumber)"
            }else{
                textLabel.text = textLabel.text! + "\(inputNumber)"
            }
        }
        numberOnScreen = Double(textLabel.text!) ?? 0
        makeOKNumberString(from: Double(textLabel.text!)!)

        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        textLabel.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
        operation = .none
        startNew = true
    }
    
    @IBAction func add(_ sender: UIButton) {
        textLabel.text = "+"
        operation = .add
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        textLabel.text = "-"
        operation = .subtract
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        textLabel.text = "x"
        operation = .multiply
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func divide(_ sender: UIButton) {
        textLabel.text = "/"
        operation = .divide
        performingMath = true
        previousNumber = numberOnScreen
    }
    
    @IBAction func factorial(_ sender: UIButton) {
        previousNumber = numberOnScreen
        performingMath = true
        if performingMath == true{
            let num = doFactorial(Int(previousNumber))
            textLabel.text = "\(num)"
        }
        performingMath = false
        startNew = true
        makeOKNumberString(from: Double(textLabel.text!)!)
    }
    
    func doFactorial(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }else {
            return n * doFactorial(n - 1)
        }
    }
    
    @IBAction func equal(_ sender: UIButton) {
        if performingMath == true{
            switch operation {
            case .add:
                textLabel.text = "\(previousNumber + numberOnScreen)"
            case .subtract:
                textLabel.text = "\(previousNumber - numberOnScreen)"
            case .multiply:
                textLabel.text = "\(previousNumber * numberOnScreen)"
            case .divide:
                textLabel.text = "\(previousNumber / numberOnScreen)"
            case .none  :
                textLabel.text = "0"
            }
            performingMath = false
            startNew = true
            makeOKNumberString(from: Double(textLabel.text!)!)
        }
    }
    
    func makeOKNumberString(from number:Double){
        var okText: String
        if floor(number) == number{
            okText = "\(Int(number))"
        }else{
            okText = "\(number)"
        }
        if okText.count >= 10{
            okText = String(okText.prefix(10))
        }
        textLabel.text = okText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
