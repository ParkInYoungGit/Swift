//
//  ViewController.swift
//  0204quizflower
//
//  Created by YOUNG on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    var imgList: [String] = []
    var repImage: UIImage?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        imgList = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
        
        imgView.image = UIImage(named: "flower_01.png")
        lblTitle.text = imgList[count]
        
    }

    @IBAction func btnPrevious(_ sender: UIButton) {
        if count == 0{
            count = 5
        }else{
            count -= 1
        }
        imgView.image = UIImage(named: imgList[count])
        lblTitle.text = imgList[count]
    }
        
    
    @IBAction func btnNext(_ sender: UIButton) {
        if count == 5{
            count = 0
        }else{
            count += 1
        }
        imgView.image = UIImage(named: imgList[count])
        lblTitle.text = imgList[count]
    }
    
}

