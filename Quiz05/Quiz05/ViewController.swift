//
//  ViewController.swift
//  Quiz05
//
//  Created by SeungYeon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvResult: UITextView!
    @IBOutlet weak var tfNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnGGD(_ sender: UIButton) {
        
        let strNumber = tfNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !strNumber.isEmpty{
            for i in 1...9{
                tvResult.text += "\(strNumber) X \(i) = \(Int(strNumber)!*i) \n"
            }
            tfNumber.text?.removeAll()
            
        }
    }
}

