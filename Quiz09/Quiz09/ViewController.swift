//
//  ViewController.swift
//  Quiz09
//
//  Created by SeungYeon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvMessage: UITextView!
    @IBOutlet weak var tfMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvMessage.isEditable = false //Read Only
    }

    @IBAction func btnResponse(_ sender: UIButton) {
        
        let strNumber = tfMessage.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !strNumber.isEmpty{
            tvMessage.text += tfMessage.text! + "\n"
            tfMessage.text?.removeAll()
        }
    }
    
    @IBAction func btnEmoji(_ sender: UIButton) {
        tfMessage.text! += "😁"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

