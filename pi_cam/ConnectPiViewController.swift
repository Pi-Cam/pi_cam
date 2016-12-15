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
    
    //MARK: IBOUTLETS
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var wifiTextField: UITextField!
    @IBOutlet weak var backButton: UIImageView!
    
    //MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        var counter = 0
        var timer = Timer()
        
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
    
    func setUpButtons(){
        
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goBack)))
        backButton.isUserInteractionEnabled = true
    }
    
    func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    func sendData() {
        let string = "wifi,\(wifiTextField.text!),\(passwordTextField.text!)"
        let result = self.nrfManager.writeString(string)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        passwordTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func connectButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations:{
            self.mainStackView.alpha = 0
        }, completion:{(true) in
            var a = DotLoder(frame: CGRect.zero, masterView: self.view, counter: 2, height: nil)
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


