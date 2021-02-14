//
//  ViewController.swift
//  TextName
//
//  Created by YOUNG on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnName(_ sender: Any) {
        lblWelcome.text = "Welcome ! \(txtName.text!)"
    }
    
    @IBAction func btnClear(_ sender: Any) {
        lblWelcome.text = "Welcome!"
        txtName.text?.removeAll()
    }
}

