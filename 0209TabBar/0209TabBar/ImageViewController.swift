//
//  ViewController.swift
//  ImageView
//
//  Created by YOUNG on 2021/02/04.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    var imgOn: UIImage? // 켜진 전구 이미지
    var imgOff: UIImage? // 꺼진 전구 이미지
    var isZoom = false // 이미지 확대 여부 (처음에 이미지 뜰 때 확대된것이 아님)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미지 파일 연결
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        // imgView 에 image 할당
        imgView.image = imgOn
        
    }

    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        // 이미지 크기를 두배로
        let scale: CGFloat = 2.0 // 크기 2배로 곱한 상수
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if isZoom{
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("이미지 확대", for: .normal)
        }else{
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("이미지 축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom // 상태 바꾸기
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
       
        switch sender.isOn{
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
        
//        if sender.isOn{
//            imgView.image = imgOn
//        }else{
//            imgView.image = imgOff
//        }
    
    }
}//--------------------
