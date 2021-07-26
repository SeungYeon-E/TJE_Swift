//
//  ViewController.swift
//  MultiLine
//
//  Created by SeungYeon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvResult: UITextView!
    @IBOutlet weak var tfInput: UITextField!
    
    override func viewDidLoad() { // 한번 실행되고 실행 다시 안된다. 초기값!!
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvResult.isEditable = false //Read Only
    }

    @IBAction func btnAppend(_ sender: UIButton) {
        // 빈칸 데이터는 제외한다.
        let strInput = tfInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // 빈칸이 아니면 실행해라
        if !strInput.isEmpty{
            tvResult.text += tfInput.text! + "\n"
            tfInput.text?.removeAll()
        }
        
    }
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.view.endEditing(true)
   }
    
} // ViewController

