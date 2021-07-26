//
//  ViewController.swift
//  Quiz11
//
//  Created by SeungYeon on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblDan: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tvResult: UITextView!
    
    var danNum = Array(2...9)
    var danArray: [String] = []
    var maxArrayNum = 0
    let viewColumn = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        maxArrayNum = danNum.count
        
        for i in 0..<maxArrayNum{
            danArray.append("\(danNum[i])단")
        }
        
        
        lblDan.text = danArray[0]
        tvResult.text = gugudan(danNum[0])
        pickerView.dataSource = self
        pickerView.delegate = self
    }


}

extension ViewController: UIPickerViewDataSource{
    
    // pickerView의 컬럼갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn
    }
    // 출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
    
    
}

extension ViewController: UIPickerViewDelegate{
    // PickerView에 Title입히기
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent comfonent:Int) -> String? {
        return danArray[row]
    }
    
    //pickerView에 image선택
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblDan.text = danArray[row]
        tvResult.text = gugudan(row+2)
    }
}

func gugudan(_ num: Int) -> String {
    var strDan :String = ""
    for i in 1...9 {
        strDan += "\(num) X \(i) = \((num) * i) \n"
    }
    return strDan
}
