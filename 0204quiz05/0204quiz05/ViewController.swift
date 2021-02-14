//
//  ViewController.swift
//  0204quiz05
//
//  Created by YOUNG on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!

    var imgOn: UIImage? // 켜진 전구 이미지
    var imgOff: UIImage? // 꺼진 전구 이미지
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 이미지 파일 연결
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        // imgView 에 image 할당
        imgView.image = imgOn
    }

    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        switch sender.isOn{
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
        
    }
    
    @IBAction func switchResizeImage(_ sender: UISwitch) {
        // 이미지 크기를 두배로
        let scale: CGFloat = 2.0 // 크기 2배로 곱한 상수
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if sender.isOn{
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
        }else{
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    
}

