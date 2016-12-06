//
//  GROUPViewController.swift
//  pi_cam
//
//  Created by Marquavious on 12/6/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class GROUPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageOnUIView)
        view.addSubview(buttonView)
        setUpButtonView()
        setUpImageView()
        
    }
 
    let buttonView: UIView = {
        var buttonView = UIView()
        buttonView.translatesAutoresizingMaskIntoConstraints = true
        buttonView.backgroundColor = .black
        buttonView.alpha = 0.5
        return buttonView
    }()
    
    func setUpButtonView(){
        buttonView.frame = CGRect(x: view.bounds.size.width/2, y: view.bounds.size.width/2, width: 115, height: 115)
        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    let imageOnUIView: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .blue
        image.image = UIImage(named: "pi")
        image.contentMode = .scaleAspectFit
        return image
    }()
//
    func setUpImageView(){
        imageOnUIView.frame = CGRect(x: 0, y: 0, width: 95, height: 95)
        imageOnUIView.backgroundColor = UIColor.red
        let cx = NSLayoutConstraint(item: imageOnUIView, attribute: .centerX, relatedBy: .equal, toItem: buttonView, attribute: .centerX, multiplier: 1, constant: 0)
        imageOnUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageOnUIView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // add constraints...
        
        buttonView.addSubview(imageOnUIView)
        
    }
//
}
