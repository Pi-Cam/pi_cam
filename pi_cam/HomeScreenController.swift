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
        flow.minimumInteritemSpacing = -20
        flow.minimumLineSpacing = -20
        collectionView.collectionViewLayout = flow
        
        setUpNavBar()
//        setUpScrollView()
//        loadStreamers()
//        setUpSecondScrollView()
//        loadCircleStreamers()
        setUpTabBar()
    }
    
    func setUpNavBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 25/255, green: 26/255, blue: 26/255, alpha: 1)
        self.navigationController?.navigationBar.alpha = 1
    }
    
    func setUpTabBar(){
        UITabBar.appearance().barTintColor = UIColor(red: 25/255, green: 26/255, blue: 26/255, alpha: 1)
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
    
//    func setUpSecondScrollView(){
//        topScrollView.isPagingEnabled = true
//        topScrollView.showsHorizontalScrollIndicator = false
//             topScrollView.contentSize = CGSize(width: self.topScrollView.bounds.width * CGFloat(featureArray.count), height: 1.0)
//        topScrollView.delegate = self
//        topScrollView.contentInset.top = 0
//        
//    }
    
//    func loadCircleStreamers() {
//        for (index, streamer) in featureArray.enumerated() {
//            if let streamView = Bundle.main.loadNibNamed("circleView", owner: self, options: nil)?.first as? circleView {
//                
//                streamView.streamerImageView.image = #imageLiteral(resourceName: "logo")
//                streamView.streamerImageView.contentMode = .scaleToFill
//                topScrollView.addSubview(streamView)
//        
//            
//                    streamView.backgroundColor = .green
//                
//                
//                mainScrollView.layoutIfNeeded()
//                streamView.frame.size.width = (self.mainScrollView.frame.size.width - (itemsOnScreen * padding)) /  itemsOnScreen
//                streamView.frame.size.height = streamView.frame.size.width
//                streamView.frame.origin.x = CGFloat(index) * (streamView.frame.width + padding)
//                streamView.clipsToBounds = true
//                streamView.layer.cornerRadius = streamView.frame.size.width / 2
//
//            }
//        }
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "circleView", for: indexPath) as! circleView
        
        print("---------------------------> \(indexPath)")
        
//        if indexPath == [0,1]{
//            cell.backgroundColor = .red
//        } else {
//             cell.backgroundColor = .green
//        }
        //cell.layer.cornerRadius = cell.frame.width / 2

        cell.contentMode = .scaleAspectFit
        //cell.clipsToBounds = true
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageIndicator.currentPage = Int(page)
    }
    
}

