//
//  HomeScreenController.swift
//  pi_cam
//
//  Created by Marquavious on 1/10/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class HomeScreenController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var topScrollView: UIScrollView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var mainScrollView: UIScrollView!
    var featureArray = [1,2,3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        setUpScrollView()
        loadStreamers()
        setUpSecondScrollView()
        loadCircleStreamers()
        setUpTabBar()
    }
    
    func setUpNavBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 25/255, green: 26/255, blue: 26/255, alpha: 1)
        self.navigationController?.navigationBar.alpha = 1
//        self.navigationController?.navigationBar.clipsToBounds = true
    }
    
    func setUpTabBar(){
        UITabBar.appearance().barTintColor = UIColor(red: 25/255, green: 26/255, blue: 26/255, alpha: 1)
//        
//        navigationController?.navigationItem.leftBarButtonItem?.image = UIImage(named: "HAMM")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)

    }
    
    func setUpScrollView(){
        mainScrollView.isPagingEnabled = true
        mainScrollView.contentSize = CGSize(width: self.mainScrollView.bounds.width * CGFloat(featureArray.count), height: 1.0)
        mainScrollView.showsHorizontalScrollIndicator = false
        mainScrollView.delegate = self
        mainScrollView.contentInset.top = 0
 
    }
    
    func loadStreamers() {
        for (index, streamer) in featureArray.enumerated() {
            if let streamView = Bundle.main.loadNibNamed("StreamInformationView", owner: self, options: nil)?.first as? StreamInformationView {
                mainScrollView.addSubview(streamView)
                streamView.frame.size.height = self.mainScrollView.bounds.size.height
                streamView.frame.size.width = self.mainScrollView.bounds.size.width
                streamView.frame.origin.x = CGFloat(index) * self.mainScrollView.bounds.size.width
            }
        }
    }
    
    func setUpSecondScrollView(){
        topScrollView.isPagingEnabled = true
        topScrollView.showsHorizontalScrollIndicator = false
             topScrollView.contentSize = CGSize(width: self.topScrollView.bounds.width * CGFloat(featureArray.count), height: 1.0)
        topScrollView.delegate = self
        topScrollView.contentInset.top = 0
        
    }
    
    func loadCircleStreamers() {
        for (index, streamer) in featureArray.enumerated() {
            if let streamView = Bundle.main.loadNibNamed("circleView", owner: self, options: nil)?.first as? circleView {
                topScrollView.addSubview(streamView)
                if index == 1{
                    streamView.streamerImageView.backgroundColor = .green
                }
                
                streamView.frame.size.height = self.topScrollView.bounds.size.height
                streamView.frame.size.width = self.topScrollView.bounds.size.width
                streamView.frame.origin.x = CGFloat(index) * streamView.bounds.width

            }
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageIndicator.currentPage = Int(page)
    }
}

