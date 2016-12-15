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
    var masterView: UIView!
    var a = 19
    var outer = 35
    var dots = [UIImageView]()
    
    init(frame: CGRect, masterView: UIView, counter: Int){
        super.init(frame:frame)
        self.masterView = masterView
        self.counter = counter
        dots += [dotViewOne,dotViewTwo,dotViewThree,dotViewFour]
        for i in dots {
            masterView.addSubview(i)
        }
        setUpdotViewOne()
        setUpdotViewTwo()
        setUpdotViewThree()
        setUpdotViewFour()
        timer = Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: #selector(countUp), userInfo: nil, repeats: true)
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
    
    func setUpdotViewOne(){
        dotViewOne.centerXAnchor.constraint(equalTo: masterView.centerXAnchor).isActive = true
        dotViewOne.centerYAnchor.constraint(equalTo: masterView.centerYAnchor).isActive = true
        dotViewOne.frame = CGRect(x:((masterView.bounds.size.width/2) - CGFloat(outer)) - 12, y: (masterView.bounds.size.height/2) + 55, width: 12, height: 12)
    }
    
    func setUpdotViewTwo(){
        dotViewTwo.centerXAnchor.constraint(equalTo: masterView.centerXAnchor).isActive = true
        dotViewTwo.centerYAnchor.constraint(equalTo: masterView.centerYAnchor).isActive = true
        dotViewTwo.frame = CGRect(x:(masterView.bounds.size.width/2) - CGFloat(a), y: (masterView.bounds.size.height/2) + 55, width: 12, height: 12)
    }
    
    func setUpdotViewThree(){
        dotViewThree.centerXAnchor.constraint(equalTo: masterView.centerXAnchor).isActive = true
        dotViewThree.centerYAnchor.constraint(equalTo: masterView.centerYAnchor).isActive = true
        dotViewThree.frame = CGRect(x:((masterView.bounds.size.width/2) + CGFloat(a)) - 12, y: (masterView.bounds.size.height/2) + 55, width: 12, height: 12)
    }
    
    func setUpdotViewFour(){
        dotViewFour.centerXAnchor.constraint(equalTo: masterView.centerXAnchor).isActive = true
        dotViewFour.centerYAnchor.constraint(equalTo: masterView.centerYAnchor).isActive = true
        dotViewFour.frame = CGRect(x:((masterView.bounds.size.width/2) + CGFloat(outer)), y: (masterView.bounds.size.height/2) + 55, width: 12, height: 12)
    }
    
    func countUp(){
        counter += 1
        animateDots()
    }
}
