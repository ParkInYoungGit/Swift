//
//  ViewController.swift
//  0205Quiz01
//
//  Created by YOUNG on 2021/02/05.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tfResult: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfResult.delegate = self //tfResult에 Event가 발생하면 ViewController에 넘겨준다
    }

    
    @IBAction func btnResult(_ sender: UIButton) {
        //lblResult.text = tfResult.text
        _ = textFieldShouldReturn(tfResult)
        } // return값은 주나 누군지 정의는 안함. 함수에 Bool이 있기 때문에
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        lblResult.text = tfResult.text
        return true
    }
}

