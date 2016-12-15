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
        _ = PiImage(frame: CGRect.zero, masterView: view)
        startBlutoothManager()
        nrfManager.verbose = true
        nrfManager.delegate = self
        setUpTimer()
        countUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timer.fire()
        print(counter)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    func countUp(){
        counter += 1
        print(counter)
        checkForConnection()
    }
    
    func setUpTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: #selector(InitialScreenVC.countUp), userInfo: nil, repeats: true)
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
    
    func startBlutoothManager(){
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
    }
}

