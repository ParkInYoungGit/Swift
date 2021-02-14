////
////  CrawlModel.swift
////  0210CralingQuiz
////
////  Created by YOUNG on 2021/02/10.
////
//
//import Foundation
//import Kanna
//
//protocol CrawlModelProtocol {
//    func itemDownloaded(items: String)
//}
//
//class CrawlModel: NSObject{
//    var delegate: CrawlModelProtocol!
//    
//    func dataCrawling(){
//        let mainURL = "https://ncov.mohw.go.kr/#live_regional2"
//        var locations: String = ""
//        
//        
//      
//        guard let main = URL(string: mainURL) else{
//            print("Error \(mainURL) doesn't seem to be a valid URL.")
//            return
//        }
//        do{
//            let htmlData = try String(contentsOf: main, encoding: .utf8)
//            let doc = try HTML(html: htmlData, encoding: .utf8)
//            
//            var count = 0
//            // //*[@id="main_maplayout"]/button[9]/span[2]
//            // //*[@id="main_maplayout"]/button[10]/span[2]
//            for title in doc.xpath("//*[@id='main_maplayout']/button[10]/span[2]"){
//            print(count, ":", title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
//            count += 1
//            let countStr = String(format: "%3d", count)
//            let tempStr = "\(countStr) : \(String(title.text!.trimmingCharacters(in: .whitespacesAndNewlines)))"
//                locations = tempStr
//                print(locations)
//                
//            }
//            print("----------------------------------------")
//        }catch let error{
//            print("Error: \(error)")
//        }
//        DispatchQueue.main.async(execute: {() -> Void in // aync로 넘긴다.
//            self.delegate.itemDownloaded(items: locations)
//        })
//    }
//}
