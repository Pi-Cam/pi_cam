//
//  StreamController.swift
//  pi_cam
//
//  Created by Marquavious on 12/15/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit
//import MediaPlayer
import MjpegStreamingKit


class StreamController: UIViewController {
    
    var url: URL?
    var streamingController: MjpegStreamingController!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidAppear(_ animated: Bool) {
        streamingController = MjpegStreamingController(imageView: imageView)
        url = URL(string: "http://pistream.ngrok.io/stream/video.mjpeg")
        // http://webcams.hotelcozumel.com.mx:6003/axis-cgi/mjpg/video.cgi?resolution=320x240&dummy=1458771208837
        streamingController.contentURL = url!
        streamingController.play()

    }
    
    @IBAction func stopStream(_ sender: Any) {
        streamingController.stop()
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
}
    
