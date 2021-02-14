//
//  ViewController.swift
//  0205quizAlramAlert
//
//  Created by YOUNG on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblChangeTime: UILabel!
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0 // 시간 interval 1초
    var selectTime = ""
    var state = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
           
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" // 년도-월-일 요일 (오전/오후) 시간:분
        lblChangeTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))"
        selectTime = formatter.string(from: datePickerView.date)
    }
    
    
    
    @objc func updateTime(){
        let date = NSDate() // NS:Next Step
            let formatter = DateFormatter()
                
            formatter.locale = Locale(identifier: "ko")
            formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" // 년도-월-일 요일 (오전/오후) 시간:분
            lblCurrentTime.text = "현재 시간: \(formatter.string(from: date as Date))"
            let currentTime = formatter.string(from: date as Date)
        
        
        
            if currentTime == selectTime {
                if state{
                    state = false
                    
                let alramAlert = UIAlertController(title: "알림", message: "설정된 시간입니다 !", preferredStyle: UIAlertController.Style.alert)
                    alramAlert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.green
                let alretAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                
                alramAlert.addAction(alretAction)
                present(alramAlert, animated: true, completion: nil)
                    
                }
            }else{
                state = true
            }
    }
    
}

