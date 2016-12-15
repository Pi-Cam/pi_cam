//
//  SelectWifiVC.swift
//  pi_cam
//
//  Created by Marquavious on 12/1/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class SelectWifiVC: UIViewController, UITableViewDataSource, UITableViewDelegate, NRFManagerDelegate {
    
    //MARK:BLUETOOTHMANAGER
    var nrfManager:NRFManager!
    
    //MARK: IBOUTLETS
    @IBOutlet weak var backButtonImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = UIViewAutoresizing.flexibleHeight
    }
    
    func setUpButtons(){
        backButtonImage.isUserInteractionEnabled = true
        backButtonImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonPressed)))
    }
    
    //MARK: TABLEVIEW FUNCTIONS
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wifiCell",  for: indexPath) as! WifiTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "setUpPi", sender: self)
    }
    
    //MARK: OTHER FUNCTIONS
    func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}

