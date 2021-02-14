//
//  ViewController.swift
//  0203Calcul
//
//  Created by YOUNG on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    @IBOutlet weak var addResult: UITextField!
    @IBOutlet weak var subResult: UITextField!
    @IBOutlet weak var mulResult: UITextField!
    @IBOutlet weak var mok: UITextField!
    @IBOutlet weak var nmg: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    
    
    var num1 = 0
    var num2 = 0
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readOnly()
    }

    @IBAction func btnResult(_ sender: Any) {
        let firstNo = Int(firstNum.text!)
        let secoNo = Int(secondNum.text!)
        
        if let _: Int = firstNo, (secoNo != nil){
            num1 = Int(firstNo!)
            num2 = Int(secoNo!)
            
            let sum = add(a: num1, b: num2)
            addResult.text = String(sum)
            
            let sub2 = sub(a: num1, b: num2)
           subResult.text = String(sub2)
            
            let mul2 = mul(a: num1, b: num2)
            mulResult.text = String(mul2)
            
            let mok2 = num1 / num2
            mok.text = String(mok2)
            
            let nmg2 = num1 % num2
            nmg.text = String(nmg2)
            
            lblResult.text = "계산이 완료 되었습니다."
            
        }else{
            lblResult.text = "숫자를 입력하세요"
        }
    }
    
    
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func sub(a: Int, b: Int) -> Int {
        return a - b
    }
    
    func mul(a: Int, b: Int) -> Int {
        return a * b
    }

    func readOnly(){
        addResult.isUserInteractionEnabled = false
        subResult.isUserInteractionEnabled = false
        mulResult.isUserInteractionEnabled = false
        mok.isUserInteractionEnabled = false
        nmg.isUserInteractionEnabled = false
        }
}

