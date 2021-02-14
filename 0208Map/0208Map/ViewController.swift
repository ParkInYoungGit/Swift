//
//  ViewController.swift
//  0208Map
//
//  Created by YOUNG on 2021/02/08.
//

import UIKit
import MapKit // <-------
class ViewController: UIViewController, CLLocationManagerDelegate { //CLLocationManagerDelegate 반드시 입력
    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationinfo1: UILabel!
    @IBOutlet weak var lblLocationinfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationinfo1.text = ""
        lblLocationinfo2.text = ""
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도를 최고로 설정
        
        locationManager.requestWhenInUseAuthorization() // 위치 데이터를 확인하기 위해 요청
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        
        myMap.showsUserLocation = true
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            self.lblLocationinfo1.text = ""
            self.lblLocationinfo2.text = ""
            locationManager.startUpdatingLocation()
        }else if sender.selectedSegmentIndex == 1{
            // 둘리 뮤지엄
            setAnnotation(latitudeValue: 37.65243153, longitudeValue: 127.0276397, delta: 0.01, title: "둘리 뮤지엄", subTitle: "서울특별시 도봉구 1길 6")
            self.lblLocationinfo1.text = "보고 계신 위치"
            self.lblLocationinfo2.text = "둘리 뮤지엄"
        }else if sender.selectedSegmentIndex == 2{
            // 서대문형무소역사관
            setAnnotation(latitudeValue: 37.57244171, longitudeValue: 126.9595412, delta: 0.01, title: "서대문 형무소 역사관", subTitle: "서울특별시 서대문구 통일로 251")
            self.lblLocationinfo1.text = "보고 계신 위치"
            self.lblLocationinfo2.text = "서대문 형무소 역사관"
        }
    }
    
    // 위도와 경도에 대한 함수
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
             
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue) // 이 좌표값은 GPS가 가져온다.
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span) // 가로세로 크기를 동일하게 키우겠다. span은 확장
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    
    // 위치가 업데이트 되었을 때 지도의 위치를 표시하는 함수
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
            self.lblLocationinfo1.text = "현재 위치"
            self.lblLocationinfo2.text = address
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
} // ----------------

