//
//  ViewController.swift
//  0205QuizPickerviewgugudan
//
//  Created by YOUNG on 2021/02/05.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var pickerNum: UIPickerView!
    @IBOutlet weak var tvResult: UITextView!
    @IBOutlet weak var lblDan: UILabel!
    let PICKER_VIEW_COLUMN = 1
    let MAX_ARRAY_NUM = 9
    var dan: [Int] = [2, 3, 4, 5, 6, 7, 8, 9]
 // var dan = [Int](2...9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblDan.text = "\(dan[0])단 "
        gugudan(j: 0)
    }


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dan.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblDan.text = String(dan[row])
        gugudan(j: row)
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(dan[row])단"
    }

    func gugudan(j: Int) {
        tvResult.text = ""
        for i in 1...MAX_ARRAY_NUM{
                tvResult.text += "\(dan[j]) X \(i) = \(dan[j] * i) \n"
                print(i)
                }
        lblDan.text = "\(dan[j])단 "
    }
}
