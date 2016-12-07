//
//  AddButtonClass.swift
//  pi_cam
//
//  Created by Marquavious on 12/6/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class AddButtonClass: UIImageView {

    let theview: UIView = {
        var view = UIView()
        view.backgroundColor = .blue
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return view
    }()
}
