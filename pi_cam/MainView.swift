//
//  MainView.swift
//  pi_cam
//
//  Created by Marquavious on 1/18/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class MainView: UIView {
    var yees = [UIImageView]()

    @IBOutlet weak var viewFour: UIImageView!
    @IBOutlet weak var viewThree: UIImageView!
    @IBOutlet weak var viewTwo: UIImageView!
    @IBOutlet weak var viewOne: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        let a = CGFloat(70)
        
        let yee4 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) , y: (viewOne.bounds.size.height / 2)-(a/2), width: a, height: a))
        yee4.image = UIImage(named: "Group 62x")
        yee4.alpha = 0.9
        yee4.contentMode = .center
        yee4.isUserInteractionEnabled = true
//        yee4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPopUp)))
        
        viewFour.addSubview(yee4)
        yees.append(yee4)
        
        let yee2 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2)  , y: (viewOne.bounds.size.height / 2)-(a/2) - 5, width: a+5, height: a+5))
        yee2.image = UIImage(named: "YTICON")
        yee2.contentMode = .scaleAspectFit
//        yee2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPopUp)))
        
        yee2.isUserInteractionEnabled = true
        
        viewTwo.addSubview(yee2)
        yees.append(yee2)
        
        let yee3 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) - 16 , y: (viewOne.bounds.size.height / 2)-(a/2) - 16, width: a+32, height: a+32))
        yee3.image = UIImage(named: "U")
        yee3.contentMode = .scaleAspectFit
        yee3.isUserInteractionEnabled = true
//        yee3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPopUp)))
        
        viewThree.addSubview(yee3)
        yees.append(yee3)
        
        let yee = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) , y: (viewOne.bounds.size.height / 2)-(a/2), width: a, height: a))
        yee.image = UIImage(named: "TWITCH")
        yee.contentMode = .scaleAspectFit
        yee.isUserInteractionEnabled = true
//        yee.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPopUp)))
        viewOne.addSubview(yee)
        yees.append(yee)

    }
    
}
