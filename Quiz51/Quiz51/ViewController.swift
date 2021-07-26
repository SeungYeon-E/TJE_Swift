//
//  ViewController.swift
//  Quiz51
//
//  Created by SeungYeon on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblZoom: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }
    
    @IBAction func sbZoom(_ sender: UISwitch) {
        // 이미지 크기를 2배로
        let scale: CGFloat = 2.0
        var newWidth: CGFloat
        var newHeigth: CGFloat
        
        switch  sender.isOn{
        case true:
            newWidth = imgView.frame.width * scale
            newHeigth = imgView.frame.height * scale
            lblZoom.text = "전구 축소"
        default:
            newWidth = imgView.frame.width / scale
            newHeigth = imgView.frame.height / scale
            lblZoom.text = "전구 확대"
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeigth)
        
    }
    
    @IBAction func sbOnOff(_ sender: UISwitch) {
        switch  sender.isOn{
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
    }

}

