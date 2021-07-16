//
//  ViewController.swift
//  Quiz32
//
//  Created by SeungYeon on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfStartNum: UITextField!
    @IBOutlet weak var tfEndNum: UITextField!
    @IBOutlet weak var lblSum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSum.text = ""
    }

    @IBAction func btnClick(_ sender: UIButton) {
        let num1: Int = Int(tfStartNum.text!)!
        let num2: Int = Int(tfEndNum.text!)!
        
        var sum: Int! = 0
        if num1 <= num2{
            for i in num1...num2{
                sum += i
            }
            lblSum.text = "합계 \(sum!)"
            
        }else{
            for i in num2...num1{
                sum += i
            }
            lblSum.text = "합계 \(sum!)"
        }
        
    }
    
}

