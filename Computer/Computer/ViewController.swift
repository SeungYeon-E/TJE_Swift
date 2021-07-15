//
//  ViewController.swift
//  Computer
//
//  Created by SeungYeon on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSize: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfColor: UITextField!
    @IBOutlet weak var tfBag: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }// viewDidLoad

    @IBAction func btnOK(_ sender: UIButton) {
        
        let name: String = "맥북프로"
        let size: Int = 16
        let weight: Double = 2.56
        let bag: Bool = false
        let color: Character = "온"
        
        tfName.text = name
        tfSize.text = String(size)
        tfWeight.text = String(weight)
        tfBag.text = String(bag)
        tfColor.text = String(color)

    }// btnOK
    
    @IBAction func btnClear(_ sender: UIButton) {
        
        tfName.text = ""
        tfSize.text?.removeAll()
        tfWeight.text = String("")
        tfBag.text?.removeAll()
        tfColor.text?.removeAll()
    }// btnClear
    
}// ViewController

