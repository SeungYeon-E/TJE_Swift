//
//  ViewController.swift
//  Quiz13-02
//
//  Created by SeungYeon on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lmgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    var images = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lmgView.image = UIImage(named: images[0])
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0 // 시작 했을때 페이지 번호
        pageControl.pageIndicatorTintColor = UIColor.green // 페이지 색
        pageControl.currentPageIndicatorTintColor = UIColor.red //현재 페이지 색
        
        // 한숟가락 Gesture 구성
        makeSingleTouch()
        
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        lmgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    func makeSingleTouch(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRigth = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRigth.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRigth)
    }
    
    @objc func  respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage += 1
                lmgView.image = UIImage(named: images[pageControl.currentPage])
            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage -= 1
                lmgView.image = UIImage(named: images[pageControl.currentPage])
            default:
                break
            }
        }
    }


}

