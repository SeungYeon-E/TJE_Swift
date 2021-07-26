//
//  ViewController.swift
//  Hybrid
//
//  Created by SeungYeon on 2021/07/21.
//

import UIKit
import WebKit // *******

class ViewController: UIViewController {

    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let tempSite = "https://www.naver.com"
//        let myUrl = URL(string: tempSite)
//        let myRequest = URLRequest(url: myUrl!)
//
//        myWebView.load(myRequest)
        
        loadWebPage(url: "https://www.naver.com")
        myWebView.navigationDelegate = self // 안드로이드 온크리에이트
    }
    
    func loadWebPage(url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnUrlGo(_ sender: UIButton) {
        guard let inputUrl: String = tfUrl.text else {return}
        
        loadWebPage(url: checkInputUrl(inputUrl: inputUrl))
    }
    
    // tfUrl "http://"로 시작하는지 체크
    func checkInputUrl(inputUrl: String) -> String{
        if inputUrl.hasPrefix("http://") {
            return inputUrl
        }else{
            return "http://" + inputUrl
        }
    }
    
    @IBAction func btnHtml(_ sender: UIButton) {
        // <meta name="viewport" content="width=device-width, initial-scale=2.0"> 2.0 확대가 된다.
        let htmlString = """
            <html>
                <haed>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=2.0">
                </haed>
                <body>
                    <h1>HTML String</h1>
                    <p>String변수를 이용한 웹페이지</p>
                    <p><a href = "http://jtbc.joins.com">JTBC</a>로 이동</p>
                </body>
            </html>
            """
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
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
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    @IBAction func btnGoogle(_ sender: UIButton) {
        loadWebPage(url: "https://www.google.com")
    }
    
    @IBAction func btnDaum(_ sender: UIButton) {
        loadWebPage(url: "https://www.daum.net")
    }
    
} // VeiwController

extension ViewController: WKNavigationDelegate{
    
    // Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    // Indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // Error발생시
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
}

