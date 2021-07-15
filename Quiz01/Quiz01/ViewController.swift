//
//  ViewController.swift
//  Quiz01
//
//  Created by SeungYeon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNum01: UITextField!
    @IBOutlet weak var tfNum02: UITextField!
    
    @IBOutlet weak var tfSum: UITextField!
    @IBOutlet weak var tfSub: UITextField!
    @IBOutlet weak var tfMul: UITextField!
    @IBOutlet weak var tfDiv: UITextField!
    @IBOutlet weak var tfRemainder: UITextField!
    @IBOutlet weak var lbl01: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readOnly()
        
    }
    
    @IBAction func btnOK(_ sender: UIButton) {
        // Optional 제거
        
        guard let strNum1 = tfNum01.text else { return }
        guard let strNum2 = tfNum02.text else { return }
        
        if strNum1.isEmpty == true{
            lbl01.text = "첫번째 숫자를 확인하세요!"
            tfNum01.becomeFirstResponder()
        }else if strNum2.isEmpty == true{
            lbl01.text = "두번째 숫자를 확인하세요!"
            tfNum02.becomeFirstResponder()
        }else{
            let num1 = Int(strNum1)!
            let num2 = Int(strNum2)!
            calculation(num1, num2)
//            calculation(num1: num1, num2: num2)
        }
        
//        if tfNum01.text?.isEmpty == true {
//            lbl01.text = "첫번째 숫자를 확인하세요!"
//            tfNum01.becomeFirstResponder()
//        }else if tfNum02.text?.isEmpty == true{
//            lbl01.text = "두번째 숫자를 확인하세요!"
//            tfNum02.becomeFirstResponder()
//        }else{
////            let num1 = Int(tfNum01.text!)
////            let num2 = Int(tfNum02.text!)
////
////            tfSum.text = String(num1! + num2!)
////            tfSub.text = String(num1! - num2!)
////            tfMul.text = String(num1! * num2!)
////            tfDiv.text = String(num1! / num2!)
////            tfRemainder.text = String(num1! % num2!)
//
//
//            tfSum.text = String(Int(tfNum01.text!)! + Int(tfNum02.text!)!)
//            tfSub.text = String(Int(tfNum01.text!)! - Int(tfNum02.text!)!)
//            tfMul.text = String(Int(tfNum01.text!)! * Int(tfNum02.text!)!)
//
//            if tfNum02.text == "0"{
//                tfDiv.text = "계산불가"
//                tfDiv.text = "계산불가"
//            }else{
//                tfDiv.text = String(Int(tfNum01.text!)! / Int(tfNum02.text!)!)
//                tfRemainder.text = String(Int(tfNum01.text!)! % Int(tfNum02.text!)!)
//            }
//
//            lbl01.text = "계산이 되었습니다!"
//            self.view.endEditing(true)
//        }
    }
    
    //textfild 빼고 아무데나 누르면 들어간다
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 계산 결과값 read only로 처리
    func readOnly(){
        
        //수정 못하게 막는것
        tfSum.isUserInteractionEnabled = false
        
    }
    
    // 계산함수
    func calculation(_ num1: Int, _ num2: Int){
        tfSum.text = String(num1 + num2)
        tfSub.text = String(num1 - num2)
        tfMul.text = String(num1 * num2)
        
        if num2 == 0{
            tfDiv.text = "계산불가"
            tfDiv.text = "계산불가"
        }else{
            tfDiv.text = String(num1 / num2)
            tfRemainder.text = String(num1 % num2)
        }

        lbl01.text = "계산이 되었습니다!"
        self.view.endEditing(true)
        
    }

}

