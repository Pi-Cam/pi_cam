//
//  ConnectPiViewController.swift
//  pi_cam
//
//  Created by Marquavious on 12/11/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit


class ConnectPiViewController: UIViewController, UITextFieldDelegate,NRFManagerDelegate {
    
    var nrfManager:NRFManager!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var wifiTextField: UITextField!
    @IBOutlet weak var backButton: UIImageView!

    var counter = 0
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goBack)))
        backButton.isUserInteractionEnabled = true
        
        
    
        
//        nrfManager = NRFManager(
//            onConnect: {
//                print("C: ★ Connected")
//        },
//            onDisconnect: {
//                print("C: ★ Disconnected")
//        },
//            onData: {
//                (data:Data?, string:String?)->() in
//                print("C: ⬇ Received data - String: \(string) - Data: \(data)")
//        },
//            autoConnect: true
//        )
//        
//        nrfManager.verbose = true
    }
//    
//    func startingAnimation(){
//        timer = Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: #selector(InitialScreenVC.countUp), userInfo: nil, repeats: true)
//    }
    
    func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    func sendData() {
        //                let string = "Wifi,MakeSchool,applynow"
        let string = "wifi,\(wifiTextField.text!),\(passwordTextField.text!)"
        let result = self.nrfManager.writeString(string)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        passwordTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func connectButtonPressed(_ sender: Any) {
        self.mainStackView.alpha = 0
        self.dotViewOne.alpha = 0
        self.dotViewTwo.alpha = 0
        self.dotViewThree.alpha = 0
        self.dotViewFour.alpha = 0
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations:{
            self.mainStackView.alpha = 0
            self.dotViewOne.alpha = 0
             self.dotViewTwo.alpha = 0
             self.dotViewThree.alpha = 0
             self.dotViewFour.alpha = 0
            
            self.view.addSubview(self.dotViewOne)
            self.setUpdotViewOne()
            
             self.view.addSubview(self.dotViewTwo)
             self.setUpdotViewTwo()
            
             self.view.addSubview(self.dotViewThree)
            self.setUpdotViewThree()
            
            self.view.addSubview(self.dotViewFour)
            self.setUpdotViewFour()

        }, completion: nil)        
        
//        startingAnimation()
        
        
//        sendData()
    }
    
    
    func countUp(){
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
    
   override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
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
    
    var a = 19
    var outer = 35
    
    func setUpdotViewOne(){
        dotViewOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewOne.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewOne.frame = CGRect(x:((view.bounds.size.width/2) - CGFloat(outer)) - 12, y: (view.bounds.size.height/2), width: 12, height: 12)
    }
    
    func setUpdotViewTwo(){
        dotViewTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewTwo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewTwo.frame = CGRect(x:(view.bounds.size.width/2) - CGFloat(a), y: (view.bounds.size.height/2), width: 12, height: 12)
    }
    
    func setUpdotViewThree(){
        dotViewThree.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewThree.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewThree.frame = CGRect(x:((view.bounds.size.width/2) + CGFloat(a)) - 12, y: (view.bounds.size.height/2), width: 12, height: 12)
    }
    
    func setUpdotViewFour(){
        dotViewFour.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dotViewFour.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dotViewFour.frame = CGRect(x:((view.bounds.size.width/2) + CGFloat(outer)), y: (view.bounds.size.height/2), width: 12, height: 12)
    }
}
