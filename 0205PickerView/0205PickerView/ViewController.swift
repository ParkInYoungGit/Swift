//
//  ViewController.swift
//  0205PickerView
//
//  Created by YOUNG on 2021/02/05.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    let MAX_ARRAY_NUM = 10 // 전체 이미지 갯수 (피커뷰가 범위를 구함)
    let PICKER_VIEW_COLUMN = 1 // PickerView의 컬럼 갯수
    var imageArray = [UIImage?]() // 파일 내용들이 배열에 들어간다.
    var imageFileName = ["w1.jpg", "w2.jpg", "w3.jpg", "w4.jpg", "w5.jpg", "w6.jpg", "w7.jpg", "w8.jpg", "w9.jpg", "w10.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 첫화면 Image 준비 : Image를 배열로 생성한다.
        for i in 0..<MAX_ARRAY_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
    
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    
    }

    
    
    /*
     UIPickerViewDataSource의 stubs
     */
    
    // pickerview의 컬럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // 출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }

    
    /*
     UIPickerViewDeleate의 stubs
     */
    
//    // Picker View에 fileName 배치 (fileName 알려주는 함수 (row값으로 날려줌))
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    // Picker View에 image 자체를 넣어주는 함수
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        return imageView
    }
    
    
    // Picker View에 선택된 파일명을 레이블 및 image view에 출력
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
}

