//
//  ViewController.swift
//  Navigation
//
//  Created by SeungYeon on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Java로말하면
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "Segue : Use Button!"
        }else{
            editViewController.textWayValue = "Segue : Use Bar Button!"
        }
        editViewController.textMessage = tfMessage.text!
        editViewController.delegate = self // <<<<<<<<< 내 권한을 준거야
        editViewController.isOn = isOn
    }

}

extension ViewController: EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        tfMessage.text = message
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
