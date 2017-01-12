//
//  StreamView.swift
//  pi_cam
//
//  Created by Marquavious on 1/10/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class StreamView: UIView {
    
    // @IBOutlet weak var streamerLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        
        //        let borderWidth: CGFloat = 2
        //        borderView.frame = self.frame.insetBy(dx: CGFloat(-borderWidth), dy: CGFloat(-borderWidth))
        //        borderView.layer.borderColor = UIColor.gray.cgColor
        //        borderView.layer.borderWidth = borderWidth;
        //        borderView.backgroundColor = .green
        //
        
        
        //        CGFloat borderWidth = 2.0f;
        //
        //        self.frame = CGRectInset(self.frame, -borderWidth, -borderWidth);
        //        self.layer.borderColor = [UIColor yellowColor].CGColor;
        //        self.layer.borderWidth = borderWidth;
    }
    
    
    override func awakeFromNib() {
        let borderWidth: CGFloat = 0.5
        borderView.frame = self.frame.insetBy(dx: CGFloat(-borderWidth), dy: CGFloat(-borderWidth))
        borderView.layer.borderColor = UIColor.gray.cgColor
        borderView.layer.borderWidth = borderWidth;
//        borderView.backgroundColor = .green
        
        
        for view in self.subviews as [UIView] {
            view.backgroundColor = UIColor.clear
        }
    }
    

    
}
