//
//  ViewController.swift
//  Quiz12
//
//  Created by SeungYeon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNum1: UILabel!
    @IBOutlet weak var lblNum2: UILabel!
    @IBOutlet weak var tfResult: UITextField!
    
    var num1 = 0
    var num2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        twoNum()
    }

    @IBAction func btnOK(_ sender: UIButton) {
        if tfResult.text?.isEmpty == true {
            let lampOnAlert = UIAlertController(title: "경고", message: "정답을 입력해주세요!!", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }else{
            let strResult = String(num1 * num2)
            if tfResult.text != strResult {
                let lampOnAlert = UIAlertController(title: "결과", message: "정답이 아닙니다.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
                
                lampOnAlert.addAction(onAction)
                present(lampOnAlert, animated: true, completion: nil)
                tfResult.text?.removeAll()
            }else{
                let lampOnAlert = UIAlertController(title: "결과", message: "정답입니다.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "다음 문제 진행", style: .default, handler: {ACTION in
                    self.twoNum()
                })
                
                lampOnAlert.addAction(onAction)
                present(lampOnAlert, animated: true, completion: nil)
                tfResult.text?.removeAll()
            }
        }
    }
    func twoNum() {
        num1 = genNum()
        num2 = genNum()
        lblNum1.text = String(num1)
        lblNum2.text = String(num2)
    }
    
    func genNum() -> Int {
        return Int.random(in: 1..<10)
    }

}



