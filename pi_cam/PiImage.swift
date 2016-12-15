//
//  PiImage.swift
//  pi_cam
//
//  Created by Marquavious on 12/14/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class PiImage: UIView {
    
    var masterView: UIView!
    init(frame: CGRect, masterView: UIView){
        super.init(frame:frame)
        self.masterView = masterView
        masterView.addSubview(piImage)
        setUpPiImage()
        startingAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required convenience init(imageLiteralResourceName name: String) {
        fatalError("init(imageLiteralResourceName:) has not been implemented")
    }
    
    lazy var piImage: UIImageView = {
        var imageView = UIImageView()
        imageView.alpha = 1 //chage to 0 later
        imageView.image = UIImage(named: "pi")
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func setUpPiImage(){
        piImage.centerXAnchor.constraint(equalTo: masterView.centerXAnchor).isActive = true
        piImage.centerYAnchor.constraint(equalTo: masterView.centerYAnchor).isActive = true
        piImage.frame = CGRect(x:(masterView.bounds.size.width/2) - 67.5, y: (masterView.bounds.size.height/2) - 86, width: 135, height: 172)
    }
    
    //MARK: Animation functions
    func startingAnimation() -> Bool{
        UIView.animate(withDuration: 0.7, delay: 1, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.piImage.alpha = 1.0
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.piImage.center.y -= 50
        }, completion:{(true) in
            print("Animation Done")
            
        })
        return true
    }
}
