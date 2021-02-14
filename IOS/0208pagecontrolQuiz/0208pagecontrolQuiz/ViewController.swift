//
//  ViewController.swift
//  0208pagecontrolQuiz
//
//  Created by YOUNG on 2021/02/08.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var lblNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //초기 환경 세팅 값
                pageControl.numberOfPages = 10
                pageControl.currentPage = 0
                pageControl.pageIndicatorTintColor = UIColor.gray
                pageControl.currentPageIndicatorTintColor = UIColor.black
                
                setText()
                
            }
    

    @IBAction func pageChange(_ sender: UIPageControl) {
        setText()
}


    func setText(){
        lblNum.text = String(pageControl.currentPage + 1)
        lblNum.textColor = (pageControl.currentPage + 1) % 2 == 0 ? UIColor.blue:UIColor.red
    }

}
