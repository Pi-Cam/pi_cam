//
//  StreamSquare.swift
//  pi_cam
//
//  Created by Marquavious on 12/6/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//


import UIKit
//Sets the key to false
private var materailKey = false

//Makes a extention that allows us to chooses wether the view shows the material design or not
extension UIView {
    
    //Allows bool to be changed in the inspector
    @IBInspectable var materialDesign: Bool {
        
        //getting and setting private variables
        get {
            return materailKey
        }
        set {
            materailKey = newValue
            
            // if materal is true
            if materailKey {
                //Material effect..
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 8
            } else{
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0
                self.layer.shadowColor = nil
            }
        }
    }
}
