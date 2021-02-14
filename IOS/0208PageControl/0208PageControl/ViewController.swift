//
//  ViewController.swift
//  0208PageControl
//
//  Created by YOUNG on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl! // 속성 등 설정
    
    var images = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 보여줄 총 이미지 갯수 알려주기
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0 // 현재 페이지
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[0])
    }


    @IBAction func pageChange(_ sender: UIPageControl) { // 액션 설정
        imgView.image = UIImage(named: images[pageControl.currentPage]) // pagecontrol이 어딜 눌렀는지 알고 있다.
    }
}

