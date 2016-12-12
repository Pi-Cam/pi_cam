//
//  PopOverViewController.swift
//  pi_cam
//
//  Created by Marquavious on 12/12/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class PopOverViewController: UIViewController {

    @IBAction func xButtonPressed(_ sender: Any) {
//        self.center.y += self.popOverView.frame.height
        mainScreenInstance.timer.fire()

        
        
    }
   var mainScreenInstance: MainScreenVC!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool){
//        mainScreenInstance.timer.fire()
    }

}
