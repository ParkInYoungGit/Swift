//
//  ViewController.swift
//  0204gugudan
//
//  Created by YOUNG on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var tviewResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // tviewResult의 속성을 read only
        tviewResult.isEditable = false
        
    }

    @IBAction func btnAppend(_ sender: UIButton) {
        
        let numCheck = checkNil(str: txtInput.text!)
        if numCheck == 0{
            tviewResult.text = "숫자를 입력하세요"
        }else{
            gugudan()
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

    
    // 구구단 출력 func
    func gugudan(){
        let gugu = Int(txtInput.text!)
        for i in 1...9 {
            tviewResult.text += "\(gugu!) X \(i) = \(String(format: "%2d", (gugu! * i))) \n"
        }
    }
}
