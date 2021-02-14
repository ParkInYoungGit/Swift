//
//  CrawlModel.swift
//  0210Kanna04
//
//  Created by YOUNG on 2021/02/10.
//

import Foundation
import Kanna

protocol CrawlModelProtocol: class {
    func itemDownLoaded(items: NSArray, itemsAddress: NSArray)
}

class CrawlModel: NSObject {
    var delegate: CrawlModelProtocol!
    
    func dataCrawling(year: String){
        let mainURL = "https://www.rottentomatoes.com/top/bestofrt/?year=\(year)"
        let locations = NSMutableArray()
        let locationsAddress = NSMutableArray()
        
            guard let main = URL(string: mainURL) else{
                print("Error \(mainURL) doesn't seem to be a valid URL.")
                return
            }
        do{
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
                    
            var count = 0
            for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"){
                // for console
                count += 1
                print(count, ":", title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                // working
                let tempAddress = "https://www.rottentomatoes.com\(String(describing: title["href"]!))"
                let countStr = String(format: "%3d", count)
                let tempStr = "\(countStr) : \(String(title.text!.trimmingCharacters(in: .whitespacesAndNewlines)))"
                locations.add(tempStr)
                locationsAddress.add(tempAddress)
                }
                print("----------------------------------------")
        }catch let error{
                    print("Error: \(error)")
                }
                DispatchQueue.main.async(execute: {() -> Void in // aync로 넘긴다.
                    self.delegate.itemDownLoaded(items: locations, itemsAddress: locationsAddress)
                })
            
                
    
    }
}
