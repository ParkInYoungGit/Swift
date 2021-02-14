//
//  ViewController.swift
//  0208jspQuiz
//
//  Created by YOUNG on 2021/02/08.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate  {
    @IBOutlet weak var webView: WKWebView!
    
    func loadWebPage(url: String){
       let myUrl = URL(string: url) // 인티저, 파스인트 이런거 필요없음.
       let myRequest = URLRequest(url: myUrl!)
       webView.load(myRequest)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        loadWebPage(url: "http://192.168.35.251:8080/swift/ResponseAge_01.jsp")
           
    }

    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        webView.reload()
    }

    @IBAction func btnGoback(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func btnGofoward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
}

