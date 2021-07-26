//
//  ViewController.swift
//  PageControl
//
//  Created by SeungYeon on 2021/07/21.
//

import UIKit

class PageControllerViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    var images = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage(named: images[0])
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0 // 시작 했을때 페이지 번호
        pageControl.pageIndicatorTintColor = UIColor.green // 페이지 색
        pageControl.currentPageIndicatorTintColor = UIColor.red //현재 페이지 색
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    

} // ViewController

