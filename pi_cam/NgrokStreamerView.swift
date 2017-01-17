//
//  NgrokStreamerView.swift
//  pi_cam
//
//  Created by Marquavious on 1/17/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit
import MjpegStreamingKit

class NgrokStreamerView: UIView {
    var url: URL?
    var streamingController: MjpegStreamingController!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        streamingController = MjpegStreamingController(imageView: imageView)
        url = URL(string: "http://webcams.hotelcozumel.com.mx:6003/axis-cgi/mjpg/video.cgi?resolution=320x240&dummy=1458771208837")
        // http://webcams.hotelcozumel.com.mx:6003/axis-cgi/mjpg/video.cgi?resolution=320x240&dummy=1458771208837
        streamingController.contentURL = url!
        streamingController.play()
        
    }
    
    // Double check to see if this works
    var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
}


