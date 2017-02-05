//
//  ViewController.swift
//  SideScroll
//
//  Created by David Hultgren on 2016-03-02.
//  Copyright © 2016 The PainSquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //First
        self.scrollView.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        
        //Second
        textView.textAlignment = .Center
        textView.text = "Hej BUBBEN"
        textView.textColor = .blackColor()
        self.startButton.layer.cornerRadius = 4.0
        
        //Third
        let imgOne = UIImageView(frame: CGRectMake(0, 0, scrollViewWidth, scrollViewHeight))
        imgOne.image = UIImage(named: "Slide1")
        let imgTwo = UIImageView(frame: CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight))
        imgTwo.image = UIImage(named: "Slide2")
        let imgThree = UIImageView(frame: CGRectMake(scrollViewWidth*2, 0, scrollViewWidth, scrollViewHeight))
        imgThree.image = UIImage(named: "Slide3")
        let imgFour = UIImageView(frame: CGRectMake(scrollViewWidth*3, 0, scrollViewWidth, scrollViewHeight))
        imgFour.image = UIImage(named: "Slide4")
        
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        
        //Fourth
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * 4, self.scrollView.frame.height)
       self.scrollView.delegate = self
        self.pageControl.currentPage = 0
        
    
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //Test the offset and calculate the current page scrolling ends
        let pageWidth:CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // change the indicator
        self.pageControl.currentPage = Int(currentPage)
        //Change the text accordintly
        if Int(currentPage) == 0 {
            textView.text = "Hello Bubben"
        } else if(currentPage) == 1 {
            textView.text = "Bubbelishes"
        } else if(currentPage) == 2 {
            textView.text = "Bubbelibubb"
        } else {
            textView.text = "Kepp going on"
        
        
        // show the start button on last slide, with fade
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.startButton.alpha = 1.0
     })
    }
   }
    
}