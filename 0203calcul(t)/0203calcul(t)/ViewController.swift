//
//  ViewController.swift
//  0203calcul(t)
//
//  Created by YOUNG on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtNum1: UITextField!
    @IBOutlet weak var txtNum2: UITextField!
    @IBOutlet weak var txtAddition: UITextField!
    @IBOutlet weak var txtSubtraction: UITextField!
    @IBOutlet weak var txtMultiplication: UITextField!
    @IBOutlet weak var txtDivisionQuotient: UITextField!
    @IBOutlet weak var txtDivisionRemainder: UITextField!
    @IBOutlet weak var txtMessage: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Read Only
        readOnly()
    }

    
    

    @IBAction func btnClac(_ sender: UIButton) {
        let num1Check: Int = checkNil(str: txtNum1.text!)
        let num2Check: Int = checkNil(str: txtNum2.text!)
        
        if num1Check + num2Check != 2{
            txtMessage.text = "숫자를 확인하세요!"
            clearText()
        }else{
            calculation()
            txtMessage.text = "계산이 되었습니다."
        }
    }


    // Read Only fuction
    func readOnly(){
        txtAddition.isUserInteractionEnabled = false
        txtSubtraction.isUserInteractionEnabled = false
        txtMultiplication.isUserInteractionEnabled = false
        txtDivisionQuotient.isUserInteractionEnabled = false
        txtDivisionRemainder.isUserInteractionEnabled = false
    }

    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // nil check function
    func checkNil(str: String!) -> Int {
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
        if check.isEmpty{
            return 0
        }else{
            return 1
        }
    }
    
    // calculation function
    func calculation(){
        txtAddition.text = String(Int(txtNum1.text!)! + Int(txtNum2.text!)!)
        txtSubtraction.text = String(Int(txtNum1.text!)! - Int(txtNum2.text!)!)
        txtMultiplication.text = String(Int(txtNum1.text!)! * Int(txtNum2.text!)!)
        txtDivisionQuotient.text = String(Int(txtNum1.text!)! / Int(txtNum2.text!)!)
        txtDivisionRemainder.text = String(Int(txtNum1.text!)! % Int(txtNum2.text!)!)
    }
    
    // 화면 지우기
    func clearText(){
        txtAddition.text = ""
        txtSubtraction.text = ""
        txtMultiplication.text = ""
        txtDivisionRemainder.text = ""
        txtDivisionQuotient.text = ""
    }
    
}

