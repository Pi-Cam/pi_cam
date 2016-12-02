//
//  InitialScreenVC.swift
//  pi_cam
//
//  Created by Marquavious on 11/27/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class InitialScreenVC: UIViewController {
    
    var timer = Timer()
    var counter = 0
    var startCount = false

    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.addSubview(piImage)
        setUpPiImage()
        
        view.addSubview(dotViewOne)
        setUpdotViewOne()
        
        view.addSubview(dotViewTwo)
        setUpdotViewTwo()
        
        view.addSubview(dotViewThree)
        setUpdotViewThree()
        
        view.addSubview(dotViewFour)
        setUpdotViewFour()
        
        view.addSubview(leftButton)
        setUpLeftButton()

        UIView.animate(withDuration: 0.7, delay: 1, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.piImage.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.piImage.center.y -= 50
            self.startCount = true
        }, completion: nil)
        
        
        if startCount == true {
            timer = Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: "countUp", userInfo: nil, repeats: true)
        }
        
//        displayAlert("Connection error", message: "Make sure your blutooth conntectinos is connected")
    }
    

    
    func countUp(){
        counter += 1
        print(counter)
        
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
    
    lazy var piImage: UIImageView = {
        var imageView = UIImageView()
        imageView.alpha = 0 //chage to 0 later
        imageView.image = UIImage(named: "pi")
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
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
    
    lazy var leftButton:UIButton = {
        var leftButton = UIButton()
//        leftButton.backgroundColor = UIColor.red
        leftButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("goToNextScreen")))
        leftButton.isUserInteractionEnabled = true
        return leftButton
    }()
    
    
    
    var a = 17
    var outer = 30
    
    func setUpLeftButton(){
        leftButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        leftButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        leftButton.frame = CGRect(x: (view.bounds.size.width/2), y: (view.bounds.size.height/2) + 200 , width: 200, height: 200)
    }
    
    func setUpPiImage(){
        piImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        piImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        piImage.frame = CGRect(x:(view.bounds.size.width/2) - 67.5, y: (view.bounds.size.height/2) - 86, width: 135, height: 172)
    }
    
    func setUpdotViewOne(){
        dotViewOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewOne.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewOne.frame = CGRect(x:((view.bounds.size.width/2) - CGFloat(outer)) - 12, y: (view.bounds.size.height/2) + 60, width: 12, height: 12)
    }
    
    func setUpdotViewTwo(){
        dotViewTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewTwo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewTwo.frame = CGRect(x:(view.bounds.size.width/2) - CGFloat(a), y: (view.bounds.size.height/2) + 60, width: 12, height: 12)
    }
    
    func setUpdotViewThree(){
        dotViewThree.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewThree.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewThree.frame = CGRect(x:((view.bounds.size.width/2) + CGFloat(a)) - 12, y: (view.bounds.size.height/2) + 60, width: 12, height: 12)
    }
    
    func setUpdotViewFour(){
        dotViewFour.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewFour.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewFour.frame = CGRect(x:((view.bounds.size.width/2) + CGFloat(outer)), y: (view.bounds.size.height/2) + 60, width: 12, height: 12)
    }
    
    
    func goToNextScreen(){
        print("Lit")
        //let viewController = WifiView()
        //self.present(viewController, animated: true, completion: nil)
        //performSegue(withIdentifier: "showWifi", sender: self)

        let viewController: SelectWifiViewController = self.storyboard?.instantiateViewController(withIdentifier: "SelectWifi") as! SelectWifiViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
    func displayAlert(_ title: String, message: String){
        
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

