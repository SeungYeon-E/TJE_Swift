//
//  DetailViewController.swift
//  Kanna_04
//
//  Created by SeungYeon on 2021/07/26.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    var receiveItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage(url: "https://www.rottentomatoes.com/\(receiveItem)")
        // Do any additional setup after loading the view.
    }
    
    func loadWebPage(url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
    
    func receiveItems(_ item: String) {
        receiveItem = item
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
