//
//  ViewController.swift
//  0205gugudanAlertQuiz
//
//  Created by YOUNG on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblFirstNum: UILabel!
    @IBOutlet weak var lblSecondNum: UILabel!
    @IBOutlet weak var txtResult: UITextField!
    
    var num1 = 0
    var num2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        num1 = Int.random(in: 1...9)
        num2 = Int.random(in: 1...9)
        
        lblFirstNum.text = String(num1)
        lblSecondNum.text = String(num2)
        
    }

    @IBAction func btnResult(_ sender: UIButton) {
        quiz()
 
    }
    
    
    func quiz(){
      
        if num1 * num2 == Int(txtResult.text!){
            let correctAlert = UIAlertController(title: "결과", message: "정답입니다", preferredStyle: UIAlertController.Style.alert)
            let correctAction = UIAlertAction(title: "다음 문제 진행", style: UIAlertAction.Style.default, handler: nil)
            
            correctAlert.addAction(correctAction)
            present(correctAlert, animated: true, completion: nil)
            txtResult.text = ""
            viewDidLoad()
        }else{
            let wrongAlert = UIAlertController(title: "결과", message: "틀렸습니다", preferredStyle: UIAlertController.Style.alert)
            let wrongAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            wrongAlert.addAction(wrongAction)
            present(wrongAlert, animated: true, completion: nil)
            txtResult.text = ""
        }
    }
    
}

