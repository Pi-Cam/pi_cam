//
//  Extentions.swift
//  pi_cam
//
//  Created by Marquavious on 12/14/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func displayAlert(_ title: String, message: String){
        
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
