//
//  ViewController.swift
//  0203quiz03
//
//  Created by YOUNG on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtNum: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    @IBAction func btnResult(_ sender: UIButton) {
        
        let checkNum: Int = checkNil(str: txtNum.text!)
        
        if checkNum != 1{
            lblResult.text = "숫자를 확인하세요!"
            clearText()
        }else{
            result()
        }
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

    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func result (){
        if Int(txtNum.text!)! % 2 == 0{
            lblResult.text = "입력하신 숫자는 짝수입니다."
        }else{
            lblResult.text = "입력하신 숫자는 홀수입니다."
        }
        
    }

    func clearText(){
        txtNum.text = ""
    }
    
}

