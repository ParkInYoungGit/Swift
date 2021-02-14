//
//  ViewController.swift
//  0205Alert
//
//  Created by YOUNG on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lampImage: UIImageView!
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRemove = UIImage(named: "lamp_remove.png")
    var isLampOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lampImage.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if isLampOn {
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태 입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil) // alert을 화면에 띄워준다.
        }else{
            lampImage.image = imgOn // 꺼져있다면 여기서 램프를 킨다.
            isLampOn = true // 상태를 주기 위한 변수
        }
    }
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn{
            let lampOffAlert = UIAlertController(title: "램프끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            // Clouser를 이용한 실행
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: {ACTION in // ACTION뒤에 적어주면 함수없이 실행가능
                self.lampImage.image = self.imgOff
                self.isLampOn = false
            })
          
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)  // alert 띄워주는 순서
            lampOffAlert.addAction(cancelAction)
            present(lampOffAlert, animated: true, completion: nil)
            
        }else{
            let lampOffAlert = UIAlertController(title: "경고", message: "현재 Off 상태 입니다.", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        
        let lampRemoveAlert = UIAlertController(title: "램프제거?", message: "램프를 제거할까요?", preferredStyle: UIAlertController.Style.alert)
          
        let offAction = UIAlertAction(title: "아니오 끕니다", style: UIAlertAction.Style.default, handler: {ACTION in
            self.lampImage.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다!", style: UIAlertAction.Style.default, handler: {ACTION in
            self.lampImage.image = self.imgOn
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다", style: UIAlertAction.Style.default, handler: {ACTION in
            self.lampImage.image = self.imgRemove
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
        
    }
    
}

