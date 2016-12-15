//
//  AddServiceViewController.swift
//  pi_cam
//
//  Created by Marquavious on 12/14/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class AddServiceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var chooseStreamerTableView: UIStackView!
    
    @IBOutlet weak var backButtonFromChooseStreamerSV: UIImageView!
    @IBOutlet weak var backButtonFromAddCredentialsSV: UIImageView!
    @IBOutlet weak var chooseStreamerCredentialsStackView: UIStackView!
    @IBOutlet weak var addCredentialsStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        backButtonFromAddCredentialsSV.isUserInteractionEnabled = true
        backButtonFromChooseStreamerSV.isUserInteractionEnabled = true
        backButtonFromAddCredentialsSV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goBackFromSecondAppearance)))
        
        backButtonFromChooseStreamerSV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goBackFromFirstAppearance)))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showSecondScreen()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "YoutubeStreamerTableViewCell") as? StreamerTableViewCell{
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func showSecondScreen(){
        UIView.animateKeyframes(withDuration: 0.7, delay: 0, animations:{
            self.chooseStreamerTableView.center.y -= self.chooseStreamerTableView.frame.height*2
            self.tableView.center.y -= self.tableView.frame.height*2
            self.addCredentialsStackView.center.y = self.view.center.y - self.addCredentialsStackView.frame.height/3
            self.addCredentialsStackView.center.x = self.view.center.x
            self.backButtonFromAddCredentialsSV.alpha = 1
            
        }, completion: {(true) in
            
        })
    }
    
    func goBackFromSecondAppearance(){
        print("button pressed")
        UIView.animateKeyframes(withDuration: 0.7, delay: 0, animations:{
            self.chooseStreamerTableView.center.y += self.chooseStreamerTableView.frame.height*2
            self.tableView.center.y += self.tableView.frame.height*2
            
            self.addCredentialsStackView.center.y = self.view.center.y + self.addCredentialsStackView.frame.height*1.5
            
            self.addCredentialsStackView.center.x = self.view.center.x
            self.backButtonFromAddCredentialsSV.alpha = 0
            
        }, completion: {(true) in
            
        })
    }
    
    func goBackFromFirstAppearance(){
        presentingViewController?.dismiss(animated: true)
    }
}
