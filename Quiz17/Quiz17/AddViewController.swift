//
//  AddViewController.swift
//  Quiz17
//
//  Created by SeungYeon on 2021/07/23.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tfAddText: UITextField!
    
    var imageArray = [UIImage?]()
    var maxArrayNum = 0
    let viewColumn = 1
    var imageName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        maxArrayNum = itemsImageFile.count
        
        for i in 0..<maxArrayNum{
            let image = UIImage(named: itemsImageFile[i])
            imageArray.append(image)
        }
        
        imageView.image = imageArray[1]
        imageName = itemsImageFile[1]
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.selectRow(1, inComponent:0, animated:true)
        
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
        items.append(tfAddText.text!)
        itemsImageFile.append(imageName)
        navigationController?.popViewController(animated: true)
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

extension AddViewController: UIPickerViewDataSource{
    
    // pickerView의 컬럼갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn
    }
    // 출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
    
    
}

extension AddViewController: UIPickerViewDelegate{
    // PickerView에 Title입히기
//    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent comfonent:Int) -> String? {
//        return imageArray[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        imageView.image = imageArray[row % imageArray.count]
        let image = UIImageView(image: imageArray[row])
        image.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        return image
    }
    
    
    //pickerView에 image선택
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = imageArray[row]
        imageName = itemsImageFile[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
}
