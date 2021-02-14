//
//  ViewController.swift
//  0210CralingQuiz
//
//  Created by YOUNG on 2021/02/10.
//

import UIKit
import Kanna

class ViewController: UIViewController{
   
    
   
    @IBOutlet weak var lblGyeonggi: UILabel!
    @IBOutlet weak var lblGangwon: UILabel!
    @IBOutlet weak var lblSeoul: UILabel!
    @IBOutlet weak var lblGyeongbuk: UILabel!
    @IBOutlet weak var lblJeonbuk: UILabel!
    var feedItem: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
                
        dataCrawling()
       
    }
    func dataCrawling(){
//            // 파일 읽는 것 부터 한다.                   // 파일명                 // 확장자
//            let filePath = Bundle.main.path(forResource: "covid", ofType: "htm") // IOS 에서는 파일 읽을 때 Bundle로 시작한다.
//            let myUrl = URL(fileURLWithPath: filePath!)
//
//            do{
//                let htmlData = try String(contentsOf: myUrl, encoding: .utf8)
//                let doc = try HTML(html: htmlData, encoding: .utf8)
//                //print(doc.text!)
//                print("----------------------------")
//                // h1
//                for h1 in doc.xpath("//*[@id='main_maplayout']/button[1]/span[2]"){
//                    lblSeoul.text = h1.text
//                }
//                for h1 in doc.xpath("//*[@id='main_maplayout']/button[10]/span[2]"){
//                    lblGangwon.text = h1.text
//                }
//                for h1 in doc.xpath("//*[@id='main_maplayout']/button[9]/span[2]"){
//                    lblGyeonggi.text = h1.text
//                }
//                for h1 in doc.xpath("//*[@id='main_maplayout']/button[13]/span[2]"){
//                    lblJeonbuk.text = h1.text
//                }
//                for h1 in doc.xpath("//*[@id='main_maplayout']/button[15]/span[2]"){
//                    lblGyeongbuk.text = h1.text
//                }
//
//
//            }catch let error{
//                print("Error \(error)")
//            }
//        }
        let mainUrl = "http://ncov.mohw.go.kr/"
              // 스위프트에서만 쓰는 것
              guard let main = URL(string: mainUrl) else{
                  print("Error: \(mainUrl) doesn't seem to be a vaild URL")
                  return
              }
              
              do{
                  // 이상 없을 시
                  let htmlData = try String(contentsOf: main, encoding: .utf8)
                  let doc = try HTML(html: htmlData, encoding: .utf8)
                for h1 in doc.xpath("//*[@id='main_maplayout']/button[1]/span[2]"){
                            lblSeoul.text = h1.text
                        }
                        for h1 in doc.xpath("//*[@id='main_maplayout']/button[10]/span[2]"){
                            lblGangwon.text = h1.text
                        }
                        for h1 in doc.xpath("//*[@id='main_maplayout']/button[9]/span[2]"){
                            lblGyeonggi.text = h1.text
                        }
                        for h1 in doc.xpath("//*[@id='main_maplayout']/button[13]/span[2]"){
                            lblJeonbuk.text = h1.text
                        }
                        for h1 in doc.xpath("//*[@id='main_maplayout']/button[15]/span[2]"){
                            lblGyeongbuk.text = h1.text
                        }
                  
              }catch let error {
                  print("Error \(error)")
              }
          }
}

