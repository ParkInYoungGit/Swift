//
//  ViewController.swift
//  0205Hybrid
//
//  Created by YOUNG on 2021/02/05.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicaator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        myWebView.navigationDelegate = self // 아래 btn들이 다알아서 해주게끔
        
        // 초기화면 : www.naver.com
        loadWebpage(url: "https://www.naver.com")
        
        
        
    }
    func loadWebpage(url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    // Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicaator.startAnimating()
        myActivityIndicaator.isHidden = false // 숨길거냐 묻는것에 꼭 false
    }
    
    // Indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicaator.stopAnimating()
        myActivityIndicaator.isHidden = true
    }

    // Error 발생
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicaator.stopAnimating()
        myActivityIndicaator.isHidden = true
    }
    
    func checkUrl(_ url: String) -> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http://") // 사용자가 입력한 글자에 포함되어있냐
        
        if !flag{
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    
    
    /*
     button
     */
    
    @IBAction func btnGo(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebpage(url: myUrl)
    }

    @IBAction func btnSite1(_ sender: UIButton) {
        loadWebpage(url: "https://www.daum.net")
    }
    
    @IBAction func btnSite2(_ sender: UIButton) {
        loadWebpage(url: "http://www.google.com")
    }
    
    @IBAction func btnHtml(_ sender: UIButton) {
        let htmlString = """
            <html>
            <head>
               <meta charset="utf-8">
               <meta name="viewport" content="width=device-width, initial-scale=1.0">
            </head>
            <body>
            <h1> HTML String </h1>
            <p>String 변수를 이용한 웹페이지</p>
            <p><a href=\"http://jtbc.joins.com\">JTBC</a>로 이동</p>
            </body>
            </html>
        """
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {    // 파일 이름           확장자
        let filepath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filepath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoFoward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    



}

