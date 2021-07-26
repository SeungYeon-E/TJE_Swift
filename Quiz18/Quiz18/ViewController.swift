//
//  ViewController.swift
//  Quiz18
//
//  Created by SeungYeon on 2021/07/21.
//

import UIKit
import WebKit // *******

class ViewController: UIViewController {

    @IBOutlet weak var urlPickerView: UIPickerView!
    @IBOutlet weak var wvUrl: WKWebView!
    @IBOutlet weak var aiView: UIActivityIndicatorView!
    
    var urlHap = [("네이버", "www.naver.com"), ("네이트", "www.nate.com")]
    var urlRealName = ["네이버", "네이트", "다음", "구글", "CNN"]
    var urlName = ["www.naver.com","www.nate.com","www.daum.net","www.google.com","www.cnn.com"]
    var urlArray = [String]()
    var maxArrayNum = 0
    let viewColumn = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        maxArrayNum = urlName.count
        maxArrayNum = urlHap.count
        
        for i in 0..<maxArrayNum{
            urlArray.append("https://\(urlName[i])")
        }
        
//        loadWebPage(url: urlArray[0])
        loadWebPage(url: "http://\(urlHap[0].1)")
        urlPickerView.dataSource = self
        urlPickerView.delegate = self
        wvUrl.navigationDelegate = self // 안드로이드 온크리에이트
        
    }
    
    func loadWebPage(url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        wvUrl.load(myRequest)
    }

}

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewColumn
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        maxArrayNum
    }
    
    
}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        urlRealName[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        loadWebPage(url: urlArray[row])
    }
}

extension ViewController: WKNavigationDelegate{
    
    // Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        aiView.startAnimating()
        aiView.isHidden = false
    }
    
    // Indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        aiView.stopAnimating()
        aiView.isHidden = true
    }
    
    // Error발생시
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        aiView.stopAnimating()
        aiView.isHidden = true
    }
}
