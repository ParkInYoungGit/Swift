//
//  ViewController.swift
//  0204quizflower(t)
//
//  Created by YOUNG on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    var numImage = 0
    var imagName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       displayImage(number: numImage)
        
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        numImage -= 1
        if numImage < 0 {
            numImage = imagName.count - 1
        }
        displayImage(number: numImage)
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        if numImage >= imagName.count{
            numImage = 0
        }
        displayImage(number: numImage)
    }

    func displayImage(number: Int){
        imgView.image = UIImage(named: imagName[number])
        imgTitle.text = imagName[number]
    }
}

