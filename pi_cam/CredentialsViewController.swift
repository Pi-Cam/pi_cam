//
//  CredentialsViewController.swift
//  pi_cam
//
//  Created by Marquavious on 12/12/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class CredentialsViewController: UIViewController {
 
    @IBOutlet weak var backButton: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dissmissView)))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func dissmissView(){
        presentingViewController?.dismiss(animated: true)
    }

}
