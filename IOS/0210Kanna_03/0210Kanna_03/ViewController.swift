//
//  ViewController.swift
//  0210Kanna_03
//
//  Created by YOUNG on 2021/02/10.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataCrawling()
    }

    func dataCrawling(){
        let mainURL = "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
        guard let main = URL(string: mainURL) else{
            print("ERROR \(mainURL) doesn't seem to be a vaild URL")
            return
        }
    
        do{
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            // //*[@id="top_movies_main"]/div/table/tbody/tr[1]/td[3]/a
            var count = 1
            for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"){
                print(count, ":", title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                count += 1
            }
            
        }catch let error{
            print("Error \(error)")
        }
    }

}

