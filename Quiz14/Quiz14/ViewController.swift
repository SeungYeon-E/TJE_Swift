//
//  ViewController.swift
//  Quiz14
//
//  Created by SeungYeon on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnButton(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnTimer(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func btnPageController(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
    
}

