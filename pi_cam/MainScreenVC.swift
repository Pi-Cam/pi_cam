//
//  MainScreenVC.swift
//  pi_cam
//
//  Created by Marquavious on 12/6/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class MainScreenVC: UIViewController {
    
    var timer = Timer()
    var counter = 0
    var IndexCounter = 0
    var startCount = true
    var coolWords = ["Last Stream: Dec 7, 9:00pm","Number of streams: 3","Default streamer: Youtube"]
    
    @IBOutlet weak var transformingTextLabel: UILabel!
    @IBOutlet weak var viewFour: UIImageView!
    @IBOutlet weak var viewOne: UIImageView!
    @IBOutlet weak var viewTwo: UIImageView!
    @IBOutlet weak var viewThree: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        if startCount == true {
            timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: "countUp", userInfo: nil, repeats: true)
        }
        
        
        
        transformingTextLabel.alpha = 0
        
        
        
        let a = CGFloat(70)
        let yee = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) , y: (viewOne.bounds.size.height / 2)-(a/2), width: a, height: a))
        yee.image = UIImage(named: "TWITCH")
        //        yee.backgroundColor = UIColor.blue
        yee.contentMode = .scaleAspectFit
        yee.isUserInteractionEnabled = true
        yee.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("lit")))
        viewOne.addSubview(yee)
        
        
        let yee2 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2)  , y: (viewOne.bounds.size.height / 2)-(a/2) - 5, width: a+5, height: a+5))
        yee2.image = UIImage(named: "YTICON")
        //                yee2.backgroundColor = UIColor.blue
        yee2.contentMode = .scaleAspectFit
        yee2.isUserInteractionEnabled = true
        
        yee2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("lit")))
        viewTwo.addSubview(yee2)
        
        
        let yee3 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) - 16 , y: (viewOne.bounds.size.height / 2)-(a/2) - 16, width: a+32, height: a+32))
        yee3.image = UIImage(named: "U")
        //                yee3.backgroundColor = UIColor.blue
        yee3.contentMode = .scaleAspectFit
        yee3.isUserInteractionEnabled = true
        
        yee3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("lit")))
        viewThree.addSubview(yee3)
        
        let yee4 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) , y: (viewOne.bounds.size.height / 2)-(a/2), width: a, height: a))
        yee4.image = UIImage(named: "Group 62x")
        yee4.alpha = 0.9
        //                yee4.backgroundColor = UIColor.blue
        yee4.contentMode = .center
        yee4.isUserInteractionEnabled = true
        
        yee4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("lit")))
        viewFour.addSubview(yee4)
    }
    
    func lit(){
        print("its fucking lit")
    }
    @IBAction func rightButtonPressed(_ sender: Any) {
        print("View not implemented yet..")
    }
    @IBAction func leftButtonPressed(_ sender: Any) {
        let viewController: SelectWifiVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectWifiVC") as! SelectWifiVC
        self.present(viewController, animated: true, completion: nil)
    }
    
    func countUp(){
        counter += 1
        print(counter)
        
        if (counter > 1 && counter % 2 == 0) {
            UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.transformingTextLabel.alpha = 1
                if self.IndexCounter > self.coolWords.count-1{
                    self.IndexCounter = 0
                    self.transformingTextLabel.text = self.coolWords[self.IndexCounter]
                }
                self.transformingTextLabel.text = self.coolWords[self.IndexCounter]
                
            }, completion: nil)
            
        } else {
            
            UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.transformingTextLabel.alpha = 0
                self.IndexCounter += 1

            }, completion: nil)
            
        }
    }
    
    
}


