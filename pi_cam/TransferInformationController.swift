//
//  TransferInformationController.swift
//  pi_cam
//
//  Created by Marquavious on 12/11/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit


class TransferInformationController: UIViewController, UITextFieldDelegate, NRFManagerDelegate {
    
    var nrfManager:NRFManager!
    var counter = 0
    var timer = Timer()
    
    //MARK: IBOUTLETS
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var passwordTextFieldText: UITextField!
    @IBOutlet weak var wifiTextFieldText: UITextField!
    @IBOutlet weak var backButton: UIImageView!
    
    //MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        nrfManager.verbose = true
        startTimerToCheckForConnection()
        setUpBackButton()
    }
    
    func startTimerToCheckForConnection(){
        timer = Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: #selector(checkForWifiConnection), userInfo: nil, repeats: true)
    }
    
    func setUpBackButton(){
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goBackToPreviousScreen)))
    }
    
    func goBackToPreviousScreen(){
        _ = navigationController?.popViewController(animated: true)
    }
    
    func sendData() {
        let informationToSendToDevice = "wifi,\(wifiTextFieldText.text!),\(passwordTextFieldText.text!)"
        _ = self.nrfManager.writeString(informationToSendToDevice)
    }
    
    func checkForWifiConnection() {
        let stringToTestDeviceConnection = "status"
        _ = self.nrfManager.writeString(stringToTestDeviceConnection)
    }
    
    func setUpBlutoothManager(){
        nrfManager = NRFManager(
            onConnect: {
                print("C: ★ Connected")
        },
            onDisconnect: {
                print("C: ★ Disconnected")
        },
            onData: {
                (data:Data?, string:String?)->() in
                
                if self.checkDeviceCallBack(string: string!){
                    self.performSegue(withIdentifier: "show", sender: self)
                }
                
                print("C: ⬇ Received data - String: \(string) - Data: \(data)")
        },
            autoConnect: true
        )
    }
    
    func checkDeviceCallBack(string: String) -> Bool {
        if string == "wifi_connected"{
            self.performSegue(withIdentifier: "show", sender: self)
            self.timer.invalidate()
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        passwordTextFieldText.resignFirstResponder()
        return true
    }
    
    @IBAction func connectButtonPressed(_ sender: Any) {
        sendData()
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations:{
            self.mainStackView.alpha = 0
        }, completion:{(true) in
            _ = DotLoder(frame: CGRect.zero, masterView: self.view, counter: 2, height: nil)
        })
        dismissKeyboard()
    }
    
    override func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        connectButton.addGestureRecognizer(tap)
    }
    
    override func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
}


