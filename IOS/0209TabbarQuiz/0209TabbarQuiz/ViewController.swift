//
//  ViewController.swift
//  0209TabbarQuiz
//
//  Created by YOUNG on 2021/02/09.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnButton(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnTime(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    @IBAction func btnPage(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }

}

