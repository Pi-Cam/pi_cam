//
//  MainScreenVC.swift
//  pi_cam
//
//  Created by Marquavious on 12/6/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class MainScreenVC: UIViewController, UIGestureRecognizerDelegate {
    //MARK: Vars
    var counter = 0
    var IndexCounter = 0
    var timer = Timer()
    var startCount = true
    var coolWords = ["Last Stream: Dec 7, 9:00pm","Number of streams: 3","Default streamer: Youtube"]
    var yees = [UIImageView]()
    
    @IBAction func goLivePressed(_ sender: Any) {
        performSegue(withIdentifier: "showStream", sender: self)
    }
    @IBAction func deleteServicePressed(_ sender: Any) {
    }
    //MARK: IBOutlets
    @IBOutlet weak var transformingTextLabel: UILabel!
    @IBAction func editCredentailspressed(_ sender: Any) {
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            print("animating")
            self.popOverView.center.y += self.popOverView.frame.height
            self.blackOverlay.alpha = 0
            
        }, completion: {(true) in
            print("done")
            
        })
        
        performSegue(withIdentifier: "addStreamingService", sender: self)
    }
    
    @IBAction func exitPopupMenu(_ sender: Any) {
        self.timer.fire()
        print("botton pressed")
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            print("animating")
            self.popOverView.center.y += self.popOverView.frame.height
            self.blackOverlay.alpha = 0
            
        }, completion: {(true) in
            print("done")
            
        })
    }
    @IBOutlet weak var menuStackView: UIStackView!
    @IBOutlet weak var viewFour: UIImageView!
    @IBOutlet weak var viewOne: UIImageView!
    @IBOutlet weak var viewTwo: UIImageView!
    @IBOutlet weak var viewThree: UIImageView!
    @IBOutlet weak var popOverView: UIView!
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(blackOverlay)
        view.addSubview(popOverView)
        
        popOverView.translatesAutoresizingMaskIntoConstraints = false
        blackOverlay.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        blackOverlay.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        blackOverlay.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blackOverlay.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        NSLayoutConstraint(item: popOverView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: popOverView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        popOverView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        popOverView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(MainScreenVC.startTextAnimations), userInfo: nil, repeats: true)
        
        //MARK: Set up images in view
        //I know this is bad coding practice,but I dont know how to add these to the views I connected in the storyboard.
        let a = CGFloat(70)
        
        let yee4 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) , y: (viewOne.bounds.size.height / 2)-(a/2), width: a, height: a))
        yee4.image = UIImage(named: "Group 62x")
        yee4.alpha = 0.9
        yee4.contentMode = .center
        yee4.isUserInteractionEnabled = true
        viewFour.addSubview(yee4)
        yees.append(yee4)
        
        let yee2 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2)  , y: (viewOne.bounds.size.height / 2)-(a/2) - 5, width: a+5, height: a+5))
        yee2.image = UIImage(named: "YTICON")
        yee2.contentMode = .scaleAspectFit
        yee2.isUserInteractionEnabled = true
        
        viewTwo.addSubview(yee4)
        yees.append(yee2)
        
        let yee3 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) - 16 , y: (viewOne.bounds.size.height / 2)-(a/2) - 16, width: a+32, height: a+32))
        yee3.image = UIImage(named: "U")
        yee3.contentMode = .scaleAspectFit
        yee3.isUserInteractionEnabled = true
        viewThree.addSubview(yee4)
        yees.append(yee3)
        
        let yee = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) , y: (viewOne.bounds.size.height / 2)-(a/2), width: a, height: a))
        yee.image = UIImage(named: "TWITCH")
        yee.contentMode = .scaleAspectFit
        yee.isUserInteractionEnabled = true
        yee4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPopUp)))
        viewOne.addSubview(yee4)
        yees.append(yee)
        
        
    }
    
    let blackOverlay: UIView = {
        let blackOverlay = UIView()
        blackOverlay.backgroundColor = .black
        blackOverlay.translatesAutoresizingMaskIntoConstraints = false
        blackOverlay.alpha = 0
        return blackOverlay
    }()
    
    //MARK: IBOutlets
    @IBAction func rightButtonPressed(_ sender: Any) {
        print("View not implemented yet..")
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        //        let viewController: SelectWifiVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectWifiVC") as! SelectWifiVC
        //        self.present(viewController, animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    
    func showPopUp(){
        self.timer.invalidate()
        print("botton pressed")
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            print("animating")
            self.popOverView.center.y -= self.popOverView.frame.height
            self.blackOverlay.alpha = 0.5
            
        }, completion: {(true) in
            print("done")
            
        })
    }
    
    //MARK: TextAnimation
    func startTextAnimations(){
        counter += 1
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


