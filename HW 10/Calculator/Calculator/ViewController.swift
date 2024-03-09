
import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var settingsForAllButtons: [UIButton]!
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var labelEnter: UILabel!

    var currentResult: String = ""
    var nx1 : String = ""
    var nx2 : String = ""
    var num : String = ""
    var znak : String = ""
    var vv: String = "1"
    var firstValue: Double = 0
    var secondValue: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        settingForAllButtons()
     
        
    }
    
    
    private func settingForAllButtons() {
        settingsForAllButtons.forEach({ button in
            button.layer.cornerRadius = 38
        })
    }
    
  
    
    //MARK: - IBActions
    @IBAction func numbersButtons(_ sender: UIButton) {
       
        
        
        
        if labelEnter.text!.count < 15 {
            if sender.tag == 0 {
                if labelEnter.text?.first == "0" {
                    labelEnter.text?.removeFirst()
                }
                num += "0"
                
            } else if sender.tag == 1 {
                if labelEnter.text?.first == "0" {
                    labelEnter.text?.removeFirst()
                }
                num += "1"
                
            } else if sender.tag == 2 {
                if labelEnter.text?.first == "0" {
                    labelEnter.text?.removeFirst()
                }
                num += "2"
                
            } else if sender.tag == 3 {
                if labelEnter.text?.first == "0" {
                    labelEnter.text?.removeFirst()
                }
                num += "3"
                
            } else if sender.tag == 4 {
                if labelEnter.text?.first == "0" {
                    labelEnter.text?.removeFirst()
                }
                num += "4"
                
            } else if sender.tag == 5 {
                if labelEnter.text?.first == "0" {
                    labelEnter.text?.removeFirst()
                }
                num += "5"
                
            } else if sender.tag == 6 {
                if labelEnter.text?.first == "0" {
                    labelEnter.text?.removeFirst()
                }
                num += "6"
                
            } else if sender.tag == 7 {
                if labelEnter.text?.first == "0" {
                    labelEnter.text?.removeFirst()
                }
                num += "7"
                
            } else if sender.tag == 8 {
                if labelEnter.text?.first == "0" {
                    labelEnter.text?.removeFirst()
                }
                num += "8"
                
            } else if sender.tag == 9 {
                if labelEnter.text?.first == "0" {
                    labelEnter.text?.removeFirst()
                }
                num += "9"
                
            }
            
            if vv == "1" {nx1 = num}
            if vv == "2" {nx2 = num}
            
            labelEnter.text = nx1+znak+nx2
            
            
            
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "слишком большое число!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    
    
    
    
    
    
    
    
    @IBAction func deleteLastNumber(_ sender: UIButton) {
        
        if num != "" {
            num.removeLast()
        } else if num.count == 0 {
            let alert = UIAlertController(title: "Ошибка", message: "Введите цифры!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                self.resultLabel.text = "0"
            }
            alert.addAction(action)
            self.present(alert, animated: true)
        }
        
        labelEnter.text = num
    }
    
    @IBAction func deleteAll(_ sender: UIButton) {
        num.removeAll()
        resultLabel.text = "0"
        labelEnter.text = "0"
       
        
    }
    
    @IBAction func floatNumberButton(_ sender: UIButton) {
//        if let text = labelEnter.text, text.contains("+"){
//        }
        
        
        if labelEnter.text?.last == "." {
        }
        else {
            num += "."
            labelEnter.text = num
        }
        
        
        }
    
       
       
    
    
    @IBAction func percentButton(_ sender: UIButton) {
        if !num.isEmpty {
          //  addTwoNumbers(value: "%")
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Введите знак процента после числа!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    
    
    
    
    
    @IBAction func resultButton(_ sender: UIButton) {
        
        if let num1 = Double(nx1), let num2 = Double(nx2) {
            
            if znak == "*" {
            let result = num1 * num2
                resultLabel.text = ("\(result)")
                let num1 = result
            }
            
            if znak == "-" {
            let result = num1 - num2
                resultLabel.text = ("\(result)")
            }
            
            if znak == "+" {
            let result = num1 + num2
                resultLabel.text = ("\(result)")
            }
            
            if znak == "/" {
            let result = num1 / num2
                resultLabel.text = ("\(result)")
            }
            
                
            
        } else {
            
            print("Невозможно перемножить текстовые значения меток")
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    @IBAction func operations(_ sender: UIButton) {
        
        if sender.tag == 10 {
            devisionOnZero()
           
            
            if num == "" {
                num = "0"
            }
            
            
            if validInput() && validInputForMinus() && validInputForPercent() {
                let checkedWorkingsForPercent = num.replacingOccurrences(of: "%", with: "*0.01")
                let expression = NSExpression(format: checkedWorkingsForPercent)
                let result = expression.expressionValue(with: nil, context: nil) as! Double
                let resultString = formatResult(result: result)
                currentResult = resultString
                resultLabel.text = resultString
                num = resultLabel.text!
                
            } else {
                let alert = UIAlertController(title: "Ошибка", message: "Неправильно введенные символы", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { _ in
                    self.num = ""
                    self.labelEnter.text = "0"
                }
                alert.addAction(action)
                self.present(alert, animated: true)
            }
        } 
        
        
        
        else if sender.tag == 11 {
            znak = "+"
            vv = "2"
            
            labelEnter.text = nx1 + "+"
            nx1 = resultLabel.text!
        
            
        } else if sender.tag == 12 {
            znak = "-"
            vv = "2"
            labelEnter.text = nx1 + "-"
            
            
        } else if sender.tag == 13 {
            znak = "*"
            vv = "2"
            labelEnter.text = nx1 + "*"
            
        } else if sender.tag == 14 {
            znak = "/"
            vv = "2"
            labelEnter.text = nx1 + "/"
           
        }
        
        num = ""
        
        
        
    }
    
    // MARK: Functions
    func validInput() -> Bool {
        var count = 0
        var charIndexes = [Int]()
        var previous: Int = -1
        
        for char in num {
            if specialCharacter(char: char) {
                charIndexes.append(count)
            }
            count += 1
        }
        
        for index in charIndexes {
            if index == 0 {
                return false
            } else if (index == num.count - 1) {
                return false
            } else if previous != -1 {
                if index - previous == 1 {
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func validInputForMinus() -> Bool {
        if num.last == "-" {
            return false
        }
        return true
    }
    
    func validInputForPercent() -> Bool {
        if num.contains("%+%") {
            return false
        } else if num.contains("%-%") {
            return false
        } else if num.contains("%/%") {
            return false
        } else if num.contains("%*%") {
            return false
        }
        return true
    }
    
    func specialCharacter(char: Character) -> Bool {
        if char == "*" {
            return true
        } else if char == "/" {
            return true
        } else if char == "+" {
            return true
        } else if char == "." {
            return true
        }
        return false
    }
  
    
           
    
    func devisionOnZero() {
        if num.contains("/0") {
            let alert = UIAlertController(title: "Ошибка", message: "На ноль делить нельзя!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                self.num = ""
                self.labelEnter.text = "0"
            }
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
    
    
    
    
    
    
    
    func formatResult(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
            
            
        } else {
            return String(format: "%.2f", result)
        }
        
        
        
        vv = "1"
        nx1 = resultLabel.text!
        labelEnter.text = nx1 + "+"
        num = resultLabel.text!
        
    }
    
    
  
  
}




