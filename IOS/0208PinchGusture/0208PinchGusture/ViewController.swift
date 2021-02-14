//
//  ViewController.swift
//  0208PinchGusture
//
//  Created by YOUNG on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Pinch Setup
    let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ :)))
    self.view.addGestureRecognizer(pinch)
}

    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){ // 현재의 크기에 대비해서 늘린다.
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1 // 다음 변환을 위한 scale의 속성을 1로 설정
        
    }

}

