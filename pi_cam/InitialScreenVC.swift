//
//  InitialScreenVC.swift
//  pi_cam
//
//  Created by Marquavious on 11/27/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class InitialScreenVC: UIViewController, NRFManagerDelegate {
    
    //MARK: Variables for counters
    var counter = 0
    var timer = Timer()
    var nrfManager:NRFManager!
    var raspiFound = false
    
    //MARK: ViewDidLoad
    override func viewDidLoad(){
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
        
        view.addSubview(rightButton)
        setUpRightButton()
        
        startingAnimation()
        
        nrfManager = NRFManager(
            onConnect: {
                print("C: ★ Connected")
                self.raspiFound = true
        },
            onDisconnect: {
                print("C: ★ Disconnected")
        },
            onData: {
                (data:Data?, string:String?)->() in
                print("C: ⬇ Received data - String: \(string) - Data: \(data)")
        },
            autoConnect: false
        )
        
        nrfManager.verbose = true
        nrfManager.delegate = self
    }
    
    //MARK: Animation functions
    func startingAnimation(){
        UIView.animate(withDuration: 0.7, delay: 1, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.piImage.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.piImage.center.y -= 50
        }, completion: nil)
        
        timer = Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: #selector(InitialScreenVC.countUp), userInfo: nil, repeats: true)
    }
    
    func countUp(){
        counter += 1
        checkForConnection()
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
    
    //MARK: ProromaticViews
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
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        
        leftButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(InitialScreenVC.goToNextScreen)))
        leftButton.isUserInteractionEnabled = true
        return leftButton
    }()
    
    lazy var rightButton:UIButton = {
        var rightButton = UIButton()
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        rightButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(InitialScreenVC.goToNextScreen)))
        rightButton.isUserInteractionEnabled = true
        return rightButton
    }()
    
    //MARK: Set constraints
    var a = 19
    var outer = 35
    
    func setUpLeftButton(){
        let margins = view.layoutMarginsGuide
        leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        leftButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 25).isActive = true
        leftButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setUpRightButton(){
        let margins = view.layoutMarginsGuide
        rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        rightButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 25).isActive = true
        rightButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        rightButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setUpPiImage(){
        piImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        piImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        piImage.frame = CGRect(x:(view.bounds.size.width/2) - 67.5, y: (view.bounds.size.height/2) - 86, width: 135, height: 172)
    }
    
    func setUpdotViewOne(){
        dotViewOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewOne.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewOne.frame = CGRect(x:((view.bounds.size.width/2) - CGFloat(outer)) - 12, y: (view.bounds.size.height/2) + 55, width: 12, height: 12)
    }
    
    func setUpdotViewTwo(){
        dotViewTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewTwo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewTwo.frame = CGRect(x:(view.bounds.size.width/2) - CGFloat(a), y: (view.bounds.size.height/2) + 55, width: 12, height: 12)
    }
    
    func setUpdotViewThree(){
        dotViewThree.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewThree.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewThree.frame = CGRect(x:((view.bounds.size.width/2) + CGFloat(a)) - 12, y: (view.bounds.size.height/2) + 55, width: 12, height: 12)
    }
    
    func setUpdotViewFour(){
        dotViewFour.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewFour.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewFour.frame = CGRect(x:((view.bounds.size.width/2) + CGFloat(outer)), y: (view.bounds.size.height/2) + 55, width: 12, height: 12)
    }
    
    func displayAlert(_ title: String, message: String){
        
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            self.counter = 0
            print(self.counter)
        }))
        
        self.present(alert, animated: true, completion:{
            
        })
    }
    
    func goToNextScreen(){
        performSegue(withIdentifier: "setUpConnection", sender: self)
    }
    
    func checkForConnection() {
        if counter < 10 {
            if raspiFound == false {
                if (counter > 1 && counter % 2 == 0) {
                    nrfManager.connect()
                } else{
                    print("nvm")
                }
            }else{
                performSegue(withIdentifier: "setUpConnection", sender: self)
            }
        } else {
            displayAlert("Unable to Connect", message: "Please make sure you pi cam is on and make sure your devices bluetooth is on")
            counter = 0
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
}

