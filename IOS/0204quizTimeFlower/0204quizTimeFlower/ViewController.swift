//
//  ViewController.swift
//  0204quizTimeFlower
//
//  Created by YOUNG on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 3.0 // 시간 interval 1초
    var count = 0
    
    var numImage = 0
    var imagName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        displayImage(number: numImage)
    }

    @objc func updateTime(){
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" //년도-월-일 요일 (오전/오후) 시간:분
        
        count += 1
        if count >= imagName.count {
            count = 0
      }
        displayImage(number: count)
        print(count)
    }
   
    
    
    func displayImage(number: Int){
        imgView.image = UIImage(named: imagName[number])
        imgTitle.text = imagName[number]
    }
}

