//
//  ViewController.swift
//  Quiz07
//
//  Created by SeungYeon on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfkor: UITextField!
    @IBOutlet weak var tfMath: UITextField!
    @IBOutlet weak var tfEng: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "점수를 입력후 버튼을 클릭해주세요."
    }
    
    @IBAction func btnResult(_ sender: UIButton) {
        let inputedNum1: String? = tfkor.text
        let inputedNum2: String? = tfMath.text
        let inputedNum3: String? = tfEng.text
        
        if invaildInputChecker(inputedNum1, inputedNum2, inputedNum3) == false{
            lblMessage.text = "숫자를 입력해 주세요"
            return
        }
        
        let num1 = Double(inputedNum1!)
        let num2 = Double(inputedNum2!)
        let num3 = Double(inputedNum3!)
        let avg: Double = calc(num1, num2, num3)
        let level = level(avg)
        lblMessage.text = "평균은 \(String(format:"%.2f", avg))이고 등급은 \(level)입니다."
    }
    
    func invaildInputChecker(_ num1: String?, _ num2: String?, _ num3: String?) -> Bool{
        if num1?.isEmpty == true || num3?.isEmpty == true || num3?.isEmpty == true {
            return false
        }
        return true
    }
    
    func calc(_ num1: Double!, _ num2: Double!, _ num3: Double!) -> Double{
       return Double((num1 + num2 + num3) / 3)
    }
    
    func level(_ avg: Double!) -> String{
       return String(avg >= 90 ? "A" : avg >= 80 ? "B" : avg >= 70 ? "C" : "F")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.view.endEditing(true)
    }
    
}

