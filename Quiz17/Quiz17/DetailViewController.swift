//
//  DetailViewController.swift
//  Quiz17
//
//  Created by SeungYeon on 2021/07/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var DetailImgView: UIImageView!
    @IBOutlet weak var DetailText: UILabel!
    
    var receiveItem = ""
    var receiveItemImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DetailText.text = receiveItem
        DetailImgView.image = UIImage(named: receiveItemImage)
    }
    
    func receiveItems(_ item: String, _ itemImage: String) {
        receiveItem = item
        receiveItemImage = itemImage
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
