//
//  ViewController.swift
//  DatePicker
//
//  Created by SeungYeon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    var strChangeDate: String = ""
    var strUpdateTime: String = ""
    var count = 0
    
    
    let interval = 1.0 // 1초
    let timeSelecter: Selector = #selector(ViewController.updateTime)
    //오브젝트 c에 있는거를 쓰기위해 selecter라 적어준다!!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblPickerTime.text = "시간을 선택하세요!"
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelecter, userInfo: nil, repeats: true)
        //1초동안 타임 셀렉터를 실행해라
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker){
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" //24시간 HH, 12시간 hh
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))"
        strChangeDate = formatter.string(from: datePickerView.date)
    }
    
    // Asysctype
    @objc func updateTime(){
        let date = NSDate() // Next Step
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
        
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        strUpdateTime = formatter.string(from: date as Date)
        
        if strUpdateTime == strChangeDate {
            if count % 2 == 0 {
                view.backgroundColor = UIColor.red
            }else{
                view.backgroundColor = UIColor.blue
            }
            count += 1
        }else{
            count = 0
            view.backgroundColor = UIColor.white
        }
        
    }
    
} //ViewController

