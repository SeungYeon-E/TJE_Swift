//
//  ViewController.swift
//  BtnClick
//
//  Created by SeungYeon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl01: UILabel!
    var count: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn01(_ sender: UIButton) {
        
        if count % 2 != 0 {
            lbl01.text = "Welcome!"
        }else{
            lbl01.text = "Welcome! SeungYeon"
        }
        count += 1
    }
    
}

