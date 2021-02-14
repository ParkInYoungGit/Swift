//
//  DetailViewController.swift
//  0210TablePickerQuiz
//
//  Created by YOUNG on 2021/02/10.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var imgItem: UIImageView!
    var receiveItem = ""
    var receiveImg = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgItem.image = UIImage(named: receiveImg)
        lblItem.text = receiveItem
        
        // Do any additional setup after loading the view.
    }
    
    func receiveItems(_ item: String){
        receiveItem = item

    }
    func receiveImage(_ item: String){
        receiveImg = item
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
