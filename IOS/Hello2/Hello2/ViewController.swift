//
//  ViewController.swift
//  Hello2
//
//  Created by YOUNG on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    var count = 0
    override func viewDidLoad() { // 제일 처음 실행하는 함수
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnName(_ sender: Any) {
            if((count % 2) == 0){
                lblWelcome.text = "Welcome! Young!"
            }else{
                lblWelcome.text = "Welcome!"
            }
            count += 1
        }
}

