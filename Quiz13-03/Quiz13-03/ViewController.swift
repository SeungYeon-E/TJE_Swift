//
//  ViewController.swift
//  Quiz13-03
//
//  Created by SeungYeon on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    var webSite = ["http://www.naver.com", "http://www.daum.net", "http://www.google.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebPage(url: "https://www.naver.com")
        webView.navigationDelegate = self // 안드로이드 온크리에이트
        
        pageControl.numberOfPages = webSite.count
        pageControl.currentPage = 0 // 시작 했을때 페이지 번호
        pageControl.pageIndicatorTintColor = UIColor.green // 페이지 색
        pageControl.currentPageIndicatorTintColor = UIColor.red //현재 페이지 색
        
        // 한숟가락 Gesture 구성
        makeSingleTouch()
    }
    func loadWebPage(url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        loadWebPage(url: webSite[pageControl.currentPage])
    }
    
    func makeSingleTouch(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRigth = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRigth.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRigth)
    }
    
    @objc func  respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage += 1
                loadWebPage(url: webSite[pageControl.currentPage])
            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage -= 1
                loadWebPage(url: webSite[pageControl.currentPage])
            default:
                break
            }
        }
    }


}

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

