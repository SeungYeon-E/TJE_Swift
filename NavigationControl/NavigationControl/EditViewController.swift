//
//  EditViewController.swift
//  NavigationControl
//
//  Created by SeungYeon on 2021/07/22.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var swOnOff: UISwitch!
    @IBOutlet weak var swPink: UISwitch!
    
    var isOn: Bool = false
    var isPink: Bool = false
    
    var delegate: EditDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        swOnOff.isOn = isOn
        if isOn{
            lblOnOff.text = "On"
        }else{
            lblOnOff.text = "Off"
        }
        swPink.isOn = isPink
    }
    @IBAction func btnOK(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImagePinkDone(self, isPinkOn: isPink)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swOnOffClick(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            lblOnOff.text = "On"
            swPink.isEnabled = true
        }else{
            isOn = false
            lblOnOff.text = "Off"
            isPink = false
            swPink.isOn = false
            swPink.isEnabled = false
        }
    }
    
    @IBAction func swPinkOn(_ sender: UISwitch) {
        if sender.isOn{
            isPink = true
        }else{
            isPink = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
