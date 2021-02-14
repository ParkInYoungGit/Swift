//
//  AddViewController.swift
//  0210TablePickerQuiz
//
//  Created by YOUNG on 2021/02/10.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var txtAddItem: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerImage: UIPickerView!
    
    let MAX_ARRAY_NUM = 3 // 전체 이미지 갯수 (피커뷰가 범위를 구함)
    let PICKER_VIEW_COLUMN = 1 // PickerView의 컬럼 갯수
    var imageArray = [UIImage?]() // 파일 내용들이 배열에 들어간다.
    var imageFileName = ["cart.png", "clock.png", "pencil.png"]
    var selectImage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<MAX_ARRAY_NUM{
                 let image = UIImage(named: imageFileName[i])
                 imageArray.append(image)
             }
        imageView.image = imageArray[0]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        // items에 text field의 text값을 추가
        items.append(txtAddItem.text!)
        itemsImageFile.append(selectImage)
        txtAddItem.text = ""
        navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let imageView = UIImageView(image: imageArray[row])
            imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
            return imageView
        }


        // Picker View에 선택된 파일명을 레이블 및 image view에 출력
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            imageView.image = imageArray[row]
            selectImage = imageFileName[row]
           
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
