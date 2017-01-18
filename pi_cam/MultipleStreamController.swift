//
//  MultipleStreamController.swift
//  pi_cam
//
//  Created by Marquavious on 1/14/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class MultipleStreamController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageIndindicator: UIPageControl!
    var featureArray = [1,2]
    @IBOutlet weak var multipleStreamScrollView: UIScrollView!
    var tabBarIsHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        loadStreamers()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        showAndHideTabBar()
        
    }
    
    
    func showAndHideTabBar(){
        if  tabBarIsHidden == false {
            UIView.animate(withDuration: 0.2) {
                self.tabBarController?.tabBar.frame = (self.tabBarController?.tabBar.frame.offsetBy(dx: 0, dy: (self.tabBarController?.tabBar.frame.height)!))!
                self.pageIndindicator.alpha = 0
                self.tabBarIsHidden = true
                return
            }
        }else{
            UIView.animate(withDuration: 0.2) {
                self.tabBarController?.tabBar.frame = (self.tabBarController?.tabBar.frame.offsetBy(dx: 0, dy: -(self.tabBarController?.tabBar.frame.height)!))!
                self.pageIndindicator.alpha = 1
                
                self.tabBarIsHidden = false
                
                return
            }
        }
    }
    
    
    func setUpScrollView(){
        multipleStreamScrollView.isPagingEnabled = true
        multipleStreamScrollView.contentSize = CGSize(width: self.multipleStreamScrollView.bounds.width * CGFloat(featureArray.count), height: 1.0)
        multipleStreamScrollView.showsHorizontalScrollIndicator = false
        multipleStreamScrollView.delegate = self
        multipleStreamScrollView.contentInset.top = 0
        multipleStreamScrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showAndHideTabBar)))
        
    }
    
    func loadStreamers() {
        for (index, streamer) in featureArray.enumerated() {
            
            if index == 0{
                
                if let streamView = Bundle.main.loadNibNamed("NgrokStreamerView", owner: self, options: nil)?.first as? NgrokStreamerView {
                    multipleStreamScrollView.addSubview(streamView)
                    streamView.frame.size.height = self.multipleStreamScrollView.bounds.size.height
                    streamView.frame.size.width = self.multipleStreamScrollView.bounds.size.width
                    streamView.frame.origin.x = CGFloat(index) * self.multipleStreamScrollView.bounds.size.width
                }
            } else if index == 1{
                if let streamView = Bundle.main.loadNibNamed("YoutubeStreamerView", owner: self, options: nil)?.first as? YoutubeStreamerView {
                    multipleStreamScrollView.addSubview(streamView)
                    streamView.frame.size.height = self.multipleStreamScrollView.bounds.size.height
                    streamView.frame.size.width = self.multipleStreamScrollView.bounds.size.width
//                    streamView.frame.origin.x = CGFloat(index) * self.multipleStreamScrollView.bounds.size.width
                    streamView.frame.origin.x = CGFloat(index) * self.multipleStreamScrollView.bounds.size.width

                }
                
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
}
