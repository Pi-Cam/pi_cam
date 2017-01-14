//
//  HomeScreenController.swift
//  pi_cam
//
//  Created by Marquavious on 1/10/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class HomeScreenController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var mainScrollView: UIScrollView!
    var featureArray = [1,2,3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        setUpScrollView()
        loadStreamers()
    }
    
    func setUpNavBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.alpha = 1
        self.navigationController?.navigationBar.clipsToBounds = true
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageIndicator.currentPage = Int(page)
    }
}
