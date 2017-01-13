//
//  StreamView.swift
//  pi_cam
//
//  Created by Marquavious on 1/10/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class StreamView: UIView {
    
    @IBOutlet weak var borderView: UIView!
    var mainViewController: SUPERMain!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    
    override func awakeFromNib() {
        let borderWidth: CGFloat = 0.5
        borderView.frame = self.frame.insetBy(dx: CGFloat(-borderWidth), dy: CGFloat(-borderWidth))
        borderView.layer.borderColor = UIColor.gray.cgColor
        borderView.layer.borderWidth = borderWidth;
 
    }
    
    @IBAction func goLiveButton(_ sender: Any) {
        mainViewController.performSegue(withIdentifier: "goLive", sender: self)
    }
   
}
