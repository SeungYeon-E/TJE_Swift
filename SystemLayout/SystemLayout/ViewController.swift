//
//  ViewController.swift
//  SystemLayout
//
//  Created by SeungYeon on 2021/07/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUserId: UITextField!
    @IBOutlet weak var tfUserPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // segue controll을 가지고 있어
    @IBAction func btnOK(_ sender: UIButton) {
        if tfUserId.text == "aaa" && tfUserPassword.text == "1111"{
            Share.userId = tfUserId.text!
            self.performSegue(withIdentifier: "afterChecking", sender: self)
            
        }else{
            let idAlert = UIAlertController(title: "경고", message: "ID나 암호가 불일치 합니다.", preferredStyle: .alert)
            let idAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
            idAlert.addAction(idAction)
            present(idAlert, animated: true, completion: nil)
        }
    }
    

}

