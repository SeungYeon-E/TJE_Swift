//
//  ViewController.swift
//  NavigationControl
//
//  Created by SeungYeon on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgPink = UIImage(named: "lamp_pink.png")
    
    var isOn = true
    var isPink = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        editViewController.delegate = self // <<<<<<<<< 내 권한을 준거야
        editViewController.isOn = isOn
        editViewController.isPink = isPink
        
    }
}
// 얘가 필요한건 데이터를 다시 가져오기 위해서인데
extension ViewController: EditDelegate{
    func didImagePinkDone(_ controller: EditViewController, isPinkOn: Bool) {
        if isPinkOn {
            imgView.image = imgPink
            self.isPink = true
        }else{
            self.isPink = false
        }
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
}
