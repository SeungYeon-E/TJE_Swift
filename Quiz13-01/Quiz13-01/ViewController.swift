//
//  ViewController.swift
//  Quiz13-01
//
//  Created by SeungYeon on 2021/07/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var lblWhen: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let myLoc = CLLocationManager()
    let location = [("혜화문", 37.5878892, 127.0037098), ("흥인지문", 37.5711907, 127.00950), ("창의문", 37.5926027, 126.9664771), ("숙정문", 37.5956584, 126.9810576)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLoc.delegate = self
        myLoc.requestWhenInUseAuthorization() // 승인 허용 문구 받아서 처리
        myLoc.startUpdatingLocation() // GPS 좌표 받기 시작
        mapView.showsUserLocation = true
        
        pageControl.numberOfPages = location.count
       pageControl.currentPage = 0
       pageControl.pageIndicatorTintColor = UIColor.gray
       pageControl.currentPageIndicatorTintColor = UIColor.green
    }
    
    // 좌표 값에 대한 것
    func mapMove(_ lat: CLLocationDegrees, _ lon: CLLocationDegrees, _ txt1: String){
        let pLoc = CLLocationCoordinate2DMake(lat, lon)
        //  배율
        let pSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        // 좌표 정보
        let pRegion = MKCoordinateRegion(center: pLoc, span: pSpan)
        lblWhen.text = txt1
        // 현재 지도를 좌표 정보로 보이기
        mapView.setRegion(pRegion, animated: true)
        
        setPoint(pLoc, txt1)
    }
    
    func setPoint(_ loc:CLLocationCoordinate2D, _ txt1: String) {
        let pin = MKPointAnnotation()
        
        pin.coordinate = loc
        pin.title = txt1
        
        mapView.addAnnotation(pin)

    }
    

    @IBAction func changePage(_ sender: UIPageControl) {
        mapMove(location[pageControl.currentPage].1, location[pageControl.currentPage].2, location[pageControl.currentPage].0)
    }
    
}

// myLoc = CLLocationManager()가 호출시 자동 실행
extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        mapMove(location[pageControl.currentPage].1, location[pageControl.currentPage].2, location[pageControl.currentPage].0)
        myLoc.stopUpdatingLocation() // 좌표 받기 중지
    }
}
