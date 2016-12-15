//
//  DotLoder.swift
//  pi_cam
//
//  Created by Marquavious on 12/14/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class DotLoder: UIView {
    
    var counter = 0
    var timer = Timer()
    
    override init(frame: CGRect){
        super.init(frame:frame)
        timer = Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: #selector(InitialScreenVC.countUp), userInfo: nil, repeats: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var dotViewOne: UIImageView = {
        var dotViewOne = UIImageView()
        dotViewOne.alpha = 0
        dotViewOne.image = UIImage(named: "oval")
        return dotViewOne
    }()
    
    lazy var dotViewTwo: UIImageView = {
        var dotViewTwo = UIImageView()
        dotViewTwo.alpha = 0
        
        dotViewTwo.image = UIImage(named: "oval")
        return dotViewTwo
    }()
    
    lazy var dotViewThree: UIImageView = {
        var dotViewThree = UIImageView()
        dotViewThree.alpha = 0
        dotViewThree.image = UIImage(named: "oval")
        return dotViewThree
    }()
    
    lazy var dotViewFour: UIImageView = {
        var dotViewFour = UIImageView()
        dotViewFour.alpha = 0
        dotViewFour.image = UIImage(named: "oval")
        return dotViewFour
    }()
    
    func animateDots(){
        counter += 1
        if (counter > 1 && counter % 2 == 0) {
            UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.dotViewOne.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.25, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.dotViewTwo.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.50, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.dotViewThree.alpha = 1
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.75, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.dotViewFour.alpha = 1
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.dotViewOne.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.25, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.dotViewTwo.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.50, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.dotViewThree.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 1, delay: 0.75, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.dotViewFour.alpha = 0
            }, completion: nil)
        }
    }
}
