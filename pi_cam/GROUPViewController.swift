//
//  GROUPViewController.swift
//  pi_cam
//
//  Created by Marquavious on 12/6/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class GROUPViewController: UIViewController {
    
    @IBOutlet weak var viewFour: UIImageView!
    @IBOutlet weak var viewOne: UIImageView!
    @IBOutlet weak var viewTwo: UIImageView!
    @IBOutlet weak var viewThree: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = CGFloat(70)
        
        let yee = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) , y: (viewOne.bounds.size.height / 2)-(a/2), width: a, height: a))
        yee.image = UIImage(named: "TWITCH")
//        yee.backgroundColor = UIColor.blue
        yee.contentMode = .scaleAspectFit
        
        
        let yee2 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2)  , y: (viewOne.bounds.size.height / 2)-(a/2) - 5, width: a+5, height: a+5))
        yee2.image = UIImage(named: "YTICON")
        //        yee.backgroundColor = UIColor.blue
        yee2.contentMode = .scaleAspectFit
        
        
        let yee3 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) - 16 , y: (viewOne.bounds.size.height / 2)-(a/2) - 16, width: a+32, height: a+32))
        yee3.image = UIImage(named: "U")
        //        yee.backgroundColor = UIColor.blue
        yee3.contentMode = .scaleAspectFit
        
        let yee4 = UIImageView(frame: CGRect(x: (viewOne.bounds.size.width / 2)-(a/2) , y: (viewOne.bounds.size.height / 2)-(a/2), width: a, height: a))
        yee4.image = UIImage(named: "Group 62x")
        yee4.alpha = 0.9
        //        yee.backgroundColor = UIColor.blue
        yee4.contentMode = .center
        
        
        viewOne.addSubview(yee)
        viewTwo.addSubview(yee2)
        viewThree.addSubview(yee3)
        viewFour.addSubview(yee4)
    }

}
