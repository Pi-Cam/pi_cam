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
        //        setUpPiImage()
        //
        //        view.addSubview(dotViewOne)
        //        setUpdotViewOne()
        //
        //        view.addSubview(dotViewTwo)
        //        setUpdotViewTwo()
        //
        //        view.addSubview(dotViewThree)
        //        setUpdotViewThree()
        //
        //        view.addSubview(dotViewFour)
        //        setUpdotViewFour()
        //
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
        
        
        //
        //
        //        view.addSubview(dotViewOne)
        //        setUpdotViewOne()
        //
        //        view.addSubview(dotViewTwo)
        //        setUpdotViewTwo()
        //
        //        view.addSubview(dotViewThree)
        //        setUpdotViewThree()
        //
        //        view.addSubview(dotViewFour)
        //        setUpdotViewFour()
        
        view.addSubview(leftButton)
        setUpLeftButton()
        
        view.addSubview(rightButton)
        setUpRightButton()
        
        startingAnimation()
        
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
    override func viewDidAppear(_ animated: Bool) {
        timer.fire()
        print(counter)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
}

