//
//  CredentialsViewController.swift
//  pi_cam
//
//  Created by Marquavious on 12/12/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class EditCredentialsViewController: UIViewController {
    
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var callToActionLabel: UILabel!
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var streamerLink: UITextField!
    @IBOutlet weak var streamerKey: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dissmissView)))
    }
    
    @IBAction func updateButtonPressed(_ sender: Any) {
        
    }
    
    func dissmissView(){
        presentingViewController?.dismiss(animated: true)
    }
}
