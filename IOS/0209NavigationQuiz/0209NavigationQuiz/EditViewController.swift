//
//  EditViewController.swift
//  0209NavigationQuiz
//
//  Created by YOUNG on 2021/02/09.
//

import UIKit

protocol EditDelegate {
    func didImageEditDone(_ controller: EditViewController, isOn: Bool, isYellow: Bool)
   
}



class EditViewController: UIViewController {

    @IBOutlet weak var swIsYellow: UISwitch!
    @IBOutlet weak var swIsOn: UISwitch!
    
    var delegate: EditDelegate?
    var isOn: Bool = false
    var isYellow: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swIsOn.isOn = isOn
        
    }
    
    @IBAction func swImageOn(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            
        }else{
            isOn = false
            
        }
    }
    
    @IBAction func swIsYellow(_ sender: UISwitch) {
        if sender.isOn{
            isYellow = false
            
        }else{
            isYellow = true
            
        }
      
    }
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didImageEditDone(self, isOn: isOn, isYellow: isYellow)
        }
        navigationController?.popViewController(animated: true)
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
