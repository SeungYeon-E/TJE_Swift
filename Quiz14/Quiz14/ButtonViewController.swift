//
//  ViewController.swift
//  Quiz06
//
//  Created by SeungYeon on 2021/07/15.
//

import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet weak var imageTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var numImage = 0
    var imageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView(numImage)
//        imageTitle.text = imageName[numImage]
//        imgView.image = UIImage(named: imageName[numImage])
    }

   
    @IBAction func btnPrev(_ sender: UIButton) {
        numImage -= 1
        if numImage == -1 {
            numImage = 0
        }
        imageView(numImage)
//        imageTitle.text = imageName[numImage]
//        imgView.image = UIImage(named: imageName[numImage])
    }
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        if numImage == imageName.count{
            numImage = imageName.count - 1
        }
        imageView(numImage)
//        imageTitle.text = imageName[numImage]
//        imgView.image = UIImage(named: imageName[numImage])
    }
    
    func imageView(_ image:Int){
        imageTitle.text = imageName[image]
        imgView.image = UIImage(named: imageName[image])
    }
    
}

