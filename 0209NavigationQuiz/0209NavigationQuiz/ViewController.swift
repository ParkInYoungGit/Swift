//
//  ViewController.swift
//  0209NavigationQuiz
//
//  Created by YOUNG on 2021/02/09.
//

import UIKit

class ViewController: UIViewController, EditDelegate {

    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRed = UIImage(named: "lamp_red.png")
    var isOn = true
    var isYellow = true
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let editViewControlloer = segue.destination as! EditViewController
      
        editViewControlloer.isOn = isOn
        editViewControlloer.isYellow = isYellow
        editViewControlloer.delegate = self
    }

    func didImageEditDone(_ controller: EditViewController, isOn: Bool, isYellow: Bool) {
        switch isOn{
        case true:
            switch isYellow{
            case true:
                imgView.image = imgOn
                self.isOn = true
                self.isYellow = true
            case false:
                imgView.image = imgRed
                self.isOn = true
                self.isYellow = false
            }
        case false:
            switch isYellow{
            case true:
                imgView.image = imgOff
                self.isOn = false
                self.isYellow = true
            case false:
                imgView.image = imgOff
                self.isOn = false
                self.isYellow = false
            }
        }
    }
}

