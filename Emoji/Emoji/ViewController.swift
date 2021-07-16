//
//  ViewController.swift
//  Emoji
//
//  Created by SeungYeon on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblEmoji: UILabel!
    
    var arrEmoji = ["😀", "😃", "😄", "😁", "😆"]
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblEmoji.text = arrEmoji[0]
    }
    @IBAction func btnPrev(_ sender: UIButton) {
        count -= 1
        if count == 0{
            count = arrEmoji.count
        }
        lblEmoji.text = arrEmoji[count]
        
    }
    
    @IBAction func btnPlay(_ sender: UIButton) {
        count += 1
        if count == arrEmoji.count{
            count = 0
        }
        lblEmoji.text = arrEmoji[count]
        
    }
}

