//
//  HomeScreenController.swift
//  pi_cam
//
//  Created by Marquavious on 1/10/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class HomeScreenController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var topScrollView: UIScrollView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var mainScrollView: UIScrollView!
    let itemsOnScreen: CGFloat = 5
    let padding: CGFloat = 10
    var featureArray = [1,2,3]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "circleView", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "circleView")
        
        var flow = UICollectionViewFlowLayout()
        flow.itemSize = CGSize(width: CGFloat(91), height: CGFloat(87))
        flow.scrollDirection = .horizontal
        flow.minimumInteritemSpacing = -25
        flow.minimumLineSpacing = -25
        collectionView.collectionViewLayout = flow
        
        //        collectionView.bordwe
        
        var borderWidth: CGFloat = 0.5
        
        collectionView.frame = collectionView.frame.insetBy(dx: -borderWidth, dy: -borderWidth);
        collectionView.layer.borderColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1).cgColor
        collectionView.layer.borderWidth = borderWidth;
        
        //        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        //        self.navigationController?.navigationBar.clipsToBounds = true
        
        
        
        //setUpNavBar()
        setUpScrollView()
        loadStreamers()
        //        setUpSecondScrollView()
        //        loadCircleStreamers()
        //setUpTabBar()
    }
    
    func setUpNavBar(){
        //        self.navigationController?.navigationBar.barTintColor = UIColor.red
        //            self.navigationController?.navigationBar.alpha = 1
    }
    
    func setUpTabBar(){
        //        UITabBar.appearance().barTintColor = UIColor(red: 25/255, green: 26/255, blue: 26/255, alpha: 1)
    }
    
    func setUpScrollView(){
        mainScrollView.isPagingEnabled = true
        mainScrollView.contentSize = CGSize(width: self.mainScrollView.bounds.width * CGFloat(featureArray.count), height: 1.0)
        mainScrollView.showsHorizontalScrollIndicator = false
        mainScrollView.delegate = self
        mainScrollView.contentInset.top = 0
        
    }
    
    func showStream(){
        self.tabBarController?.selectedIndex = 1
    }
    
    
    func loadStreamers() {
        for (index, streamer) in featureArray.enumerated() {
            
            if index == 0{
                if let streamView = Bundle.main.loadNibNamed("MainView", owner: self, options: nil)?.first as? MainView {
                    mainScrollView.addSubview(streamView)
                    streamView.frame.size.height = self.mainScrollView.bounds.size.height
                    streamView.frame.size.width = self.mainScrollView.bounds.size.width
                    streamView.frame.origin.x = CGFloat(index) * self.mainScrollView.bounds.size.width
                    streamView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showStream)))
                }
            } else if index == 1{
                
                if let streamView = Bundle.main.loadNibNamed("PreviousStreamsView", owner: self, options: nil)?.first as? PreviousStreamsView {
                    mainScrollView.addSubview(streamView)
                    streamView.frame.size.height = self.mainScrollView.bounds.size.height
                    streamView.frame.size.width = self.mainScrollView.bounds.size.width
                    streamView.frame.origin.x = CGFloat(index) * self.mainScrollView.bounds.size.width
                }
            }
            
            
            
            //            if let streamView = Bundle.main.loadNibNamed("StreamInformationView", owner: self, options: nil)?.first as? StreamInformationView {
            //                mainScrollView.addSubview(streamView)
            //                streamView.frame.size.height = self.mainScrollView.bounds.size.height
            //                streamView.frame.size.width = self.mainScrollView.bounds.size.width
            //                streamView.frame.origin.x = CGFloat(index) * self.mainScrollView.bounds.size.width
            //            }
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
                
                
                streamView.streamerImageView.image = #imageLiteral(resourceName: "N")
                
                
                
                streamView.streamerImageView.contentMode = .scaleToFill
                topScrollView.addSubview(streamView)
                
                
                streamView.backgroundColor = .green
                
                
                mainScrollView.layoutIfNeeded()
                streamView.frame.size.width = (self.mainScrollView.frame.size.width - (itemsOnScreen * padding)) /  itemsOnScreen
                streamView.frame.size.height = streamView.frame.size.width
                streamView.frame.origin.x = CGFloat(index) * (streamView.frame.width + padding)
                streamView.clipsToBounds = true
                streamView.layer.cornerRadius = streamView.frame.size.width / 2
                streamView.isUserInteractionEnabled = true
               
                
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "circleView", for: indexPath) as! circleView
        cell.streamerImageView.image = #imageLiteral(resourceName: "N")
        
        if indexPath[1] == 1{
            cell.streamerImageView.image = #imageLiteral(resourceName: "LIT")
        } else if indexPath[1] == 2 {
            cell.streamerImageView.image = UIImage(named: "TC")
            cell.statusIndicator.isHidden = true
        }
         cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showStream)))
        
        cell.contentMode = .scaleAspectFit
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageIndicator.currentPage = Int(page)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

