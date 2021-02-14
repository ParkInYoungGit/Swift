//
//  ViewController.swift
//  0204quizalram
//
//  Created by YOUNG on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblCurrentTIme: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0 // 시간 interval 1초
    var selectTime = ""
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" //년도-월-일 요일 (오전/오후) 시간:분
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))"
        selectTime = formatter.string(from: datePickerView.date)
    }
    
    // Async Task로 1초당 1번씩 구동
    @objc func updateTime(){
        let date = NSDate() // NS:Next Step
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" //년도-월-일 요일 (오전/오후) 시간:분
        lblCurrentTIme.text = "현재 시간: \(formatter.string(from: date as Date))"
        
        let currentTime = formatter.string(from: date as Date)
        
        print("currentTime : " + currentTime)
        print("selectTime : " + selectTime)
        
        if selectTime == currentTime{
            count += 1
            if count % 2 == 0{
                view.backgroundColor = UIColor.red      // 1초 간격으로 빨간색 배경화면이 뜬다.
                print("count 1 ", count)
            }else{
                view.backgroundColor = UIColor.blue     // 1초 간격으로 파란색 배경화면이 뜬다.
                print("count 2 ", count)
            }
        }else{
            view.backgroundColor = UIColor.white
      }
        
    }
}

