//
//  ViewController.swift
//  Smile
//
//  Created by SeungYeon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblSmile: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSmile.text = "😄"
    }

    @IBAction func btnSmile(_ sender: UIButton) {
        lblSmile.text?.append("😄")
    }
    
}

