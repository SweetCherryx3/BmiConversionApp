//
//  ViewController.swift
//  BMI_UI_CALCULATION
//
//  Created by Daniel Santos Martinez on 4/14/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtField1: UITextField!
    @IBOutlet var txtField2: UITextField!
    @IBOutlet var output: UILabel!
    @IBOutlet var bmiClass: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtField1.delegate = self
        txtField2.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedChar = "1234567890"
        let allowedCharSet = CharacterSet(charactersIn: allowedChar)
        let typedCharSet = CharacterSet(charactersIn: string)
        return allowedCharSet.isSuperset(of: typedCharSet)
    }

    
    @IBAction func calcBMI(_ sender: Any) {
        
        let height: Double? = Double(txtField1.text ?? "0") ?? 0
        let weight: Double? = Double(txtField2.text ?? "0") ?? 0
        let numMult: Double? = 703.00
        
        if (txtField1.text!.isEmpty) && (txtField2.text!.isEmpty){
            let alert = UIAlertController(title: "Error", message:  "Empty Inputs", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if  (txtField1.text!.isEmpty) {
            let alert = UIAlertController(title: "Error", message:  "Empty Height Input", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if (txtField2.text!.isEmpty) {
            let alert = UIAlertController(title: "Error", message:  "Empty Weight Input", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Exit", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        let bmi = numMult! * weight!/(height! * height!)
        let bmiToText = String(format: "%.2f", bmi)
        output.text = bmiToText
        
        if bmi >= 30 {
            bmiClass.text = "You are obese."
            bmiClass.textColor = UIColor.red
        } else if bmi >= 25{
            bmiClass.text = "You are overweight."
            bmiClass.textColor = UIColor.orange
        } else if bmi >= 18.6{
            bmiClass.text = "You are healthy."
            bmiClass.textColor = UIColor.green
        } else {
            bmiClass.text = "You are underweight."
            bmiClass.textColor = UIColor.red
        }
            
        
        switch bmi {
        case ...18.5:
            output.textColor = UIColor.red
        case 18.6...24.9:
            output.textColor = UIColor.green
        case 25.0...29.9:
            output.textColor = UIColor.orange
        default:
            output.textColor = UIColor.red

        }
    }
}

