//
//  ViewController.swift
//  Quiz10
//
//  Created by SeungYeon on 2021/07/19.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var lblImageName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    let interval = 3.0 // 1초
    let timeSelecter: Selector = #selector(TimerViewController.updateTime)
    //오브젝트 c에 있는거를 쓰기위해 selecter라 적어준다!!
    
    var numImage = 0
    var imageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelecter, userInfo: nil, repeats: true)
        //1초동안 타임 셀렉터를 실행해라
        imageView(numImage)
    }
    
    // Asysctype
    @objc func updateTime(){
        numImage += 1
        if numImage == imageName.count {
            numImage = 0
        }
        imageView(numImage)
    }
    
    func imageView(_ image:Int){
        lblImageName.text = imageName[image]
        imgView.image = UIImage(named: imageName[image])
    }

}

