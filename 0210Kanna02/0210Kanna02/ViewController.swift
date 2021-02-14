//
//  ViewController.swift
//  0210Kanna02
//
//  Created by YOUNG on 2021/02/10.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        dataCrawling()
        // Do any additional setup after loading the view.
    }
    
    func dataCrawling(){
            // 파일 읽는 것 부터 한다.                      // 파일명                 // 확장자
            let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html") // IOS 에서는 파일 읽을 때 Bundle로 시작한다.
            let myUrl = URL(fileURLWithPath: filePath!)
            
            do{
                let htmlData = try String(contentsOf: myUrl, encoding: .utf8)
                let doc = try HTML(html: htmlData, encoding: .utf8)
                print(doc.text!)
                print("----------------------------")
                // h1
                for h1 in doc.xpath("//h1"){
                    print(h1.text!)
                }
                print("----------------------------")
                // p
                for p in doc.xpath("//p"){
                    print(p.text!)
                }
                print("----------------------------")
                // a
                for a in doc.xpath("//a"){
                    print(a.text!)
                }
                
            }catch let error{
                print("Error \(error)")
            }
        }



}

