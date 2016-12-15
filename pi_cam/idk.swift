//
//  idk.swift
//  pi_cam
//
//  Created by Marquavious on 12/11/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

//import Foundation


//        UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
//            self.wifiTextField.center.x = self.view.center.x
//            self.wifiTextField.center.y = self.view.center.y
//            self.tableView.center.x -= self.view.frame.size.width
//
//            self.passwordTextField.center.x -= 200
//            self.passwordTextField.center.x = self.view.center.x
//            self.passwordTextField.center.y += 40
//
//        }, completion: { finished in
//                self.tableView.isHidden = true
////            self.wifiTextField.center.x = self.view.center.x
////            self.wifiTextField.center.y = self.view.center.y
//            self.setUpWifiTextFieldAfterAnimation()
//            self.setUpPasswordTextFieldAfterAnimation()
//        })




//        //This is for the bluetooth connection
//        nrfManager = NRFManager(
//        onConnect: {print("C: ★ Connected")},
//        onDisconnect: {print("C: ★ Disconnected")},
//        onData: {(data:Data?, string:String?)->() in print("C: ⬇ Received data - String: \(string) - Data: \(data)")},
//        autoConnect: true)
//            nrfManager.verbose = true
//            nrfManager.delegate = self
//







//    func setUpdotViewOne(){
//        dotViewOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        dotViewOne.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        dotViewOne.frame = CGRect(x:((view.bounds.size.width/2) - CGFloat(outer)) - 12, y: (view.bounds.size.height/2) + 55, width: 12, height: 12)
//    }
//
//    func setUpdotViewTwo(){
//        dotViewTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        dotViewTwo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        dotViewTwo.frame = CGRect(x:(view.bounds.size.width/2) - CGFloat(a), y: (view.bounds.size.height/2) + 55, width: 12, height: 12)
//    }
//
//    func setUpdotViewThree(){
//        dotViewThree.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        dotViewThree.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        dotViewThree.frame = CGRect(x:((view.bounds.size.width/2) + CGFloat(a)) - 12, y: (view.bounds.size.height/2) + 55, width: 12, height: 12)
//    }
//
//    func setUpdotViewFour(){
//        dotViewFour.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        dotViewFour.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        dotViewFour.frame = CGRect(x:((view.bounds.size.width/2) + CGFloat(outer)), y: (view.bounds.size.height/2) + 55, width: 12, height: 12)
//    }
//
