//
//  MultipleStreamController.swift
//  pi_cam
//
//  Created by Marquavious on 1/14/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class MultipleStreamController: UIViewController, UIScrollViewDelegate {
    
    var featureArray = [1,2,3]
    @IBOutlet weak var multipleStreamScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollView()
        loadStreamers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //        setTabBarVisible(visible:true, animated: true)
    }
    
    
    func setUpScrollView(){
        multipleStreamScrollView.isPagingEnabled = true
        multipleStreamScrollView.contentSize = CGSize(width: self.multipleStreamScrollView.bounds.width * CGFloat(featureArray.count), height: 1.0)
        multipleStreamScrollView.showsHorizontalScrollIndicator = false
        multipleStreamScrollView.delegate = self
        multipleStreamScrollView.contentInset.top = 0
    }
    
    func loadStreamers() {
        for (index, streamer) in featureArray.enumerated() {
            if let streamView = Bundle.main.loadNibNamed("NgrokStreamerView", owner: self, options: nil)?.first as? NgrokStreamerView {
                multipleStreamScrollView.addSubview(streamView)
                streamView.frame.size.height = self.multipleStreamScrollView.bounds.size.height
                streamView.frame.size.width = self.multipleStreamScrollView.bounds.size.width
                streamView.frame.origin.x = CGFloat(index) * self.multipleStreamScrollView.bounds.size.width
            }
        }
    }
    
}
