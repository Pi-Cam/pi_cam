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
//    @IBOutlet weak var WifiName: UITextField!
    
    @IBOutlet weak var wifiName: UITextField!
    @IBOutlet weak var wifiPassword: UITextField!
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(wifiTextField)
        view.addSubview(passwordTextField)
        setUpWifiTextField()
        setUpPasswordTextField()
//        print(textField.translatesAutoresizingMaskIntoConstraints = false)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        
       
    
//        //This is for the bluetooth connection
//        nrfManager = NRFManager(
//        onConnect: {print("C: ★ Connected")},
//        onDisconnect: {print("C: ★ Disconnected")},
//        onData: {(data:Data?, string:String?)->() in print("C: ⬇ Received data - String: \(string) - Data: \(data)")},
//        autoConnect: true)
//            nrfManager.verbose = true
//            nrfManager.delegate = self
//        
        }
    
    let wifiTextField: UITextField = {
       var textField = UITextField()
//        textField.backgroundColor = .red
        textField.font = UIFont(name: "Avenir Next", size: 19)
        textField.textAlignment = .center
//        textField.style
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Makeschool"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        var textField = UITextField()
        //        textField.backgroundColor = .red
        textField.font = UIFont(name: "Avenir Next", size: 19)
        textField.textAlignment = .center
        //        textField.style
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "Password"
        return textField
    }()
    
    func setUpWifiTextField(){
        NSLayoutConstraint(item: wifiTextField, attribute: .leading, relatedBy: .equal, toItem: tableView, attribute: .trailing, multiplier: 1, constant: view.frame.size.width+2).isActive = true
        wifiTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        wifiTextField.backgroundColor = .gray
        wifiTextField.widthAnchor.constraint(equalToConstant: (view.frame.size.width/1.5)).isActive = true
        wifiTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setUpPasswordTextField(){
        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: tableView, attribute: .trailing, multiplier: 1, constant: view.frame.size.width+2).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        passwordTextField.backgroundColor = .gray
        passwordTextField.widthAnchor.constraint(equalToConstant: (view.frame.size.width/1.5)).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
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
//        let string = "Wifi,MakeSchool,applynow"
        let string = "wifi,\(wifiName.text!),\(wifiPassword.text!)"
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

        UIView.animate(withDuration: 0.2, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
//            self.wifiTextField.center.x -= 200
            self.wifiTextField.center.x = self.view.center.x
            self.wifiTextField.center.y -= 30
            
//            self.passwordTextField.center.x -= 200
            self.passwordTextField.center.x = self.view.center.x
            self.passwordTextField.center.y += 30
            

            self.tableView.alpha = 0
        }, completion: nil)
        
        
//        sendData()
//        NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
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

