//
//  LoadingScreen.swift
//  pi_cam
//
//  Created by Marquavious on 11/27/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class LoadingScreen: UIViewController, NRFManagerDelegate {
    
    //MARK: Variables
    var counterToFirePiConnection = 0
    var timerForPiConnection = Timer()
    var nrfManager:NRFManager!
    var isDeviceFound = false
    
    //MARK: ViewDidLoad
    override func viewDidLoad(){
        _ = PiImage(frame: CGRect.zero, masterView: view)
        _ = DotLoder(frame: CGRect.zero, masterView: view, counter: counterToFirePiConnection, height: 55)
        startBlutoothManager()
        nrfManager.verbose = true
        nrfManager.delegate = self
        startTimer()
        countUpAndCheckForConnection()
    }
    
    //MARK: OTHER FUNCTIONS
    
    // Adds to timer and checks for connection
    func countUpAndCheckForConnection(){
        counterToFirePiConnection += 1
        checkForConnection()
    }
    
    // Starts timer
    func startTimer(){
        timerForPiConnection = Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: #selector(checkForConnection), userInfo: nil, repeats: true)
    }
    
    // Checks for bluetooth connection
    func checkForConnection() {
        if counterToFirePiConnection < 10 {
            if isDeviceFound == false {
                if (counterToFirePiConnection > 1 && counterToFirePiConnection % 2 == 0) {
                    nrfManager.connect()
                } else{
                    print("Could not connect")
                }
            } else{
                performSegue(withIdentifier: "setUpConnection", sender: self)
            }
        } else {
            timerForPiConnection.invalidate()
            displayAlert("Unable to Connect", message: "Please make sure your livePi and your bluetooth is powered on")
            timerForPiConnection.fire()
            counterToFirePiConnection = 0
        }
    }
    
    // Runs blutooth manager
    func startBlutoothManager(){
        nrfManager = NRFManager(
            onConnect: {
                print("C: ★ Connected")
                self.isDeviceFound = true
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
    
    //MARK: VIEWDIDAPPEAR
    override func viewDidAppear(_ animated: Bool) {
        timerForPiConnection.fire()
    }
    
    //MARK: VIEWDIDDISSAPEAR
    override func viewDidDisappear(_ animated: Bool) {
        timerForPiConnection.invalidate()
    }
}

