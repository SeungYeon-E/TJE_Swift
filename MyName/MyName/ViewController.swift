//
//  ViewController.swift
//  MyName
//
//  Created by SeungYeon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl01: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbl01.text = "Welcome!"
    }

    @IBAction func BtnName(_ sender: UIButton) {
        lbl01.text?.append("SeungYeon")
    }
    
}

