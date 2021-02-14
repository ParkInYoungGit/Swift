//
//  ViewController.swift
//  0208MapQuiz
//
//  Created by YOUNG on 2021/02/08.
//

import UIKit
import MapKit

let numPages = 4

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var pageControl: UIPageControl!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = numPages
        pageControl.currentPage = 0
        setAnnotation(latitudeValue: 37.5878892, longitudeValue: 127.0037098, delta: 0.01, title: "혜화문", subTitle: "서울 도성길")
        lblTitle.text = "혜화문"
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도를 최고로 설정
        
        locationManager.requestWhenInUseAuthorization() // 위치 데이터를 확인하기 위해 요청
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        
        myMap.showsUserLocation = true
        
        
        
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        if pageControl.currentPage == 0 {
            setAnnotation(latitudeValue: 37.5878892, longitudeValue: 127.0037098, delta: 0.01, title: "혜화문", subTitle: "서울 도성길")
            self.lblTitle.text = "혜화문"
        }else if pageControl.currentPage == 1{
            setAnnotation(latitudeValue: 37.5711907, longitudeValue: 127.009506, delta: 0.01, title: "흥인지문", subTitle: "")
            self.lblTitle.text = "흥인지문"
        }else if pageControl.currentPage == 2{
            setAnnotation(latitudeValue: 37.5926027, longitudeValue: 126.9664771, delta: 0.01, title: "창의문", subTitle: "")
            self.lblTitle.text = "창의문"
        }else if pageControl.currentPage == 3{
            setAnnotation(latitudeValue: 37.5956584, longitudeValue: 126.9810576, delta: 0.01, title: "숙정문", subTitle: "")
            self.lblTitle.text = "숙정문"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
      
        // 지도 100배 확대
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address: String = country!
                if pm!.locality != nil{
                    address += " "
                    address += pm!.locality!
                }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
        })
        locationManager.stopUpdatingLocation() // 끝났음을 알려준다.
    }
    
    
    // Pin 설치
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subTitle strSubTitle:String){
            
        let annotation = MKPointAnnotation() // pin
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        myMap.addAnnotation(annotation)
    }
    // 위도와 경도에 대한 함수
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
             
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) // 이 좌표값은 GPS가 가져온다.
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) // 가로세로 크기를 동일하게 키우겠다. span은 확장
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
}

