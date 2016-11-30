//
//  InitialScreenVC.swift
//  pi_cam
//
//  Created by Marquavious on 11/27/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class InitialScreenVC: UIViewController {

    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(piImage)
        setUpPiImage()
        
        UIView.animate(withDuration: 0.7, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.piImage.alpha = 1.0
        }, completion: nil)
    
        UIView.animate(withDuration: 1, delay: 1, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.piImage.center.y -= 60
        }, completion: nil)
    }
    
    lazy var piImage: UIImageView = {
        var imageView = UIImageView()
        imageView.alpha = 0.0
        imageView.image = UIImage(named: "pi")
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func setUpPiImage(){
        piImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        piImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        piImage.frame = CGRect(x:(view.bounds.size.width/2) - 67.5, y: (view.bounds.size.height/2) - 86, width: 135, height: 172)
    }
}
