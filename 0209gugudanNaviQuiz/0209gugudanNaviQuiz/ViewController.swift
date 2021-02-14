//
//  ViewController.swift
//  0209gugudanNaviQuiz
//
//  Created by YOUNG on 2021/02/09.
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
                
        
        switch num1{
        case 1: lblFirstNum.text = "흰색"
        case 2: lblFirstNum.text = "빨"
        case 3: lblFirstNum.text = "주"
        case 4: lblFirstNum.text = "노"
        case 5: lblFirstNum.text = "초"
        case 6: lblFirstNum.text = "파"
        case 7: lblFirstNum.text = "남"
        case 8: lblFirstNum.text = "보"
        case 9: lblFirstNum.text = "검정"
        default: break
        }
        
        switch num2{
        case 1: lblSecondNum.text = "흰색"
        case 2: lblSecondNum.text = "빨"
        case 3: lblSecondNum.text = "주"
        case 4: lblSecondNum.text = "노"
        case 5: lblSecondNum.text = "초"
        case 6: lblSecondNum.text = "파"
        case 7: lblSecondNum.text = "남"
        case 8: lblSecondNum.text = "보"
        case 9: lblSecondNum.text = "검정"
        default: break
        }
    
        
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

