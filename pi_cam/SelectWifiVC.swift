//
//  SelectWifiVC.swift
//  pi_cam
//
//  Created by Marquavious on 12/1/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class SelectWifiVC: UIViewController, UITableViewDataSource, UITableViewDelegate, NRFManagerDelegate {
    
    //MARK:Bluetooth managers
    var nrfManager:NRFManager!
    
    //MARK: IBOutlers
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var callToActionLabel: UILabel!
    @IBOutlet weak var piImage: UIImageView!
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = UIViewAutoresizing.flexibleHeight
    
        //This is for the bluetooth connection
        nrfManager = NRFManager(
        onConnect: {print("C: ★ Connected")},
        onDisconnect: {print("C: ★ Disconnected")},
        onData: {(data:Data?, string:String?)->() in print("C: ⬇ Received data - String: \(string) - Data: \(data)")},
        autoConnect: false)
            nrfManager.verbose = true
            nrfManager.delegate = self
        }
 
    //MARK: TableView Functions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.isHidden = true
        callToActionLabel.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wifiCell",  for: indexPath) as! WifiTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK: Bluetooth Functions
    func sendData() {
        let string = "Wifi,MakeSchool,applynow"
        let result = self.nrfManager.writeString(string)
        print("⬆ Sent string: \(string) - Result: \(result)")
    }
    
    //MARK: IBOutlet Funtions
    @IBAction func backButton(_ sender: Any) {
        let viewController: InitialScreenVC  = self.storyboard?.instantiateViewController(withIdentifier: "InitialScreenVC") as! InitialScreenVC
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func connect(_ sender: Any) {
        nrfManager.connect()
    }
    
    @IBAction func sendData(_ sender: Any) {
        sendData()
    }
    
    //MARK: Directional Buttons
    @IBAction func rightButtonPressed(_ sender: Any) {
        let viewController: MainScreenVC = self.storyboard?.instantiateViewController(withIdentifier: "MainScreenVC") as! MainScreenVC
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        let viewController: InitialScreenVC = self.storyboard?.instantiateViewController(withIdentifier: "InitialScreenVC") as! InitialScreenVC
        self.present(viewController, animated: true, completion: nil)
    }
}

