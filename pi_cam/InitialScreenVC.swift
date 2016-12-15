//
//  InitialScreenVC.swift
//  pi_cam
//
//  Created by Marquavious on 11/27/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class InitialScreenVC: UIViewController, NRFManagerDelegate {
    
    //MARK: VARIABLES
    var counter = 0
    var timer = Timer()
    var nrfManager:NRFManager!
    var raspiFound = false
    
    //MARK: VIEWDIDLOAD
    override func viewDidLoad(){
        _ = PiImage(frame: CGRect.zero, masterView: view)
        _ = DotLoder(frame: CGRect.zero, masterView: view, counter: counter, height: 55)
        startBlutoothManager()
        nrfManager.verbose = true
        nrfManager.delegate = self
        setUpTimer()
        countUp()
    }
    
    //MARK: VIEWDIDAPPEAR
    override func viewDidAppear(_ animated: Bool) {
        timer.fire()
    }
    
    //MARK: VIEWDIDDISSAPEAR
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    //MARK: OTHER FUNCTIONS
    func countUp(){
        counter += 1
        print(counter)
        checkForConnection()
    }
    
    func setUpTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: #selector(InitialScreenVC.countUp), userInfo: nil, repeats: true)
    }
    
    func checkForConnection() {
        if counter < 10 {
            if raspiFound == false {
                if (counter > 1 && counter % 2 == 0) {
                    nrfManager.connect()
                } else{
                    print("Could not connect")
                }
            }else{
                performSegue(withIdentifier: "setUpConnection", sender: self)
            }
        } else {
            displayAlert("Unable to Connect", message: "Please make sure you pi cam and your iPhones bluetooth is powered on")
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

