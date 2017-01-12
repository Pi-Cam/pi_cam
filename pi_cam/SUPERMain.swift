//
//  SUPERMain.swift
//  pi_cam
//
//  Created by Marquavious on 1/10/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class SUPERMain: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var mainScrollView: UIScrollView!
    let feature1 = ["title":"Apple Watch","price":"$0.99","image":"1"]
    let feature2 = ["title":"More Designs","price":"$1.99","image":"2"]
    let feature3 = ["title":"Notifications","price":"$0.99","image":"3"]
    var featureArray = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featureArray = [feature1,feature2,feature3]
        mainScrollView.isPagingEnabled = true
        mainScrollView.contentSize = CGSize(width: self.mainScrollView.bounds.width * CGFloat(featureArray.count), height: 1.0)
        mainScrollView.showsHorizontalScrollIndicator = false
        mainScrollView.delegate = self
        mainScrollView.contentInset.top = 0
        
//        navigationController.ba
//        navigationBarAppearace.barTintColor =
        

//        navigationController?.navigationBa
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.alpha = 1
        self.navigationController?.navigationBar.clipsToBounds = true
//        self.navigationController?.navigationBar.isTranslucent = true
        
        loadFeatures()
        
        
        //
        //        let borderWidth: CGFloat = 0.5
        //
        ////        mainScrollView.frame = mainScrollView.frame.insetBy(x: -borderWidth, y: -borderWidth);
        //        mainScrollView.layer.borderColor = UIColor.gray.cgColor
        //        mainScrollView.layer.borderWidth = borderWidth;
    }
    
    
    func loadFeatures() {
        
        for (index, feature) in featureArray.enumerated() {
            if let streamView = Bundle.main.loadNibNamed("StreamView", owner: self, options: nil)?.first as? StreamView {
                //                streamView.featureImageView.image = UIImage(named: feature["image"]!)
                //streamView.streamerLabel.text = feature["title"]
                //streamView.streamerLabel.text = feature["price"]
                
//                let borderWidth: CGFloat = 0.5
                mainScrollView.addSubview(streamView)
//                streamView.layer.borderColor = UIColor.gray.cgColor
//                streamView.layer.borderWidth = borderWidth;
                streamView.frame.size.height = self.mainScrollView.bounds.size.height
                streamView.topAnchor.constraint(equalTo: self.mainScrollView.topAnchor).isActive = true
                streamView.frame.size.width = self.mainScrollView.bounds.size.width
                streamView.frame.origin.x = CGFloat(index) * self.mainScrollView.bounds.size.width
                
            } else {
                print("IT DONT EXIST")
            }
            
        }
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageIndicator.currentPage = Int(page)
    }
    
}
