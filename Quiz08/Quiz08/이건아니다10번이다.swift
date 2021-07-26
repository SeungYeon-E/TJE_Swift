//
//  ViewController.swift
//  Quiz08
//
//  Created by SeungYeon on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tfNum: UITextField!
    @IBOutlet weak var tvMessage: UITextView!
    
    var scoreArr : [Int] = []
    var scoreName = ["국어 점수", "영어 점수", "수학 점수", "요약"]
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvMessage.text = ""
        lblName.text = "\(scoreName[count])"
    }

    @IBAction func btnResult(_ sender: Any) {
        
        if tfNum.text?.isEmpty == true{
            tvMessage.text = "숫자를 입력해 주세요"
            return
        }
        
        count += 1
        scoreArr.append(Int(tfNum.text!)!)
//
//        if count < scoreName.count{
//            tfNum.text?.removeAll()
//            lblName.text = "\(scoreName[count])"
//        }else{
//            // 숨기기
//            tfNum.isHidden = true
//
//            count = 0
//            let sumResult = sum()
//            let avgReault = avg(sumResult)
//            tvMessage.text = "총점은 \(sumResult) 입니다."
//            tvMessage.text += "평균은 \(String(format:"%.2f", avgReault)) 입니다."
//
//            for i in 0...scoreArr.count-1{
//                tvMessage.text += "\(scoreName[i])점수는 \(scoreArr[i]) 입니다."
//            }
//        }
        tvMessage.text = ""
        switch count {
        case 0..<3:
            tfNum.text?.removeAll()
            lblName.text = "\(scoreName[count])"
        case 3..<4:
            // 숨기기
            tfNum.isHidden = true
            lblName.text = "\(scoreName[count])"
            
            let sumResult = sum()
            let avgReault = avg(sumResult)
            tvMessage.text = "총점은 \(sumResult) 입니다."
            tvMessage.text += "평균은 \(String(format:"%.2f", avgReault)) 입니다."
            
            for i in 0...scoreArr.count-1{
                tvMessage.text += "\(scoreName[i])점수는 \(scoreArr[i]) 입니다."
            }
            tfNum.text?.removeAll()
        default:
            count = 0
            tfNum.isHidden = false
            lblName.text = "\(scoreName[count])"
            tfNum.text?.removeAll()
        }
        
    }
    
    func sum() -> Int{
        var sum = 0
        for i in scoreArr{
            sum += i
        }
       return sum
    }
    
    func avg(_ avg: Int) -> Double{
        var avgReault = avg / scoreArr.count
       return Double(avgReault)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.view.endEditing(true)
    }
    
}

