//
//  StreamVC.swift
//  pi_cam
//
//  Created by Marquavious on 12/15/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit
//import MediaPlayer
import MjpegStreamingKit


class StreamVC: UIViewController {
//    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var imageView: UIImageView!
    
    var url: URL?
    
    var streamingController: MjpegStreamingController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        streamingController = MjpegStreamingController(imageView: imageView)
        url = URL(string: "http://pistream.ngrok.io/stream/video.mjpeg")
//        http://webcams.hotelcozumel.com.mx:6003/axis-cgi/mjpg/video.cgi?resolution=320x240&dummy=1458771208837
        streamingController.contentURL = url!
        streamingController.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//    
//    @IBAction func playAndStop(sender: AnyObject) {
//        if playing {
//            playButton.setTitle("Play", for: .normal)
//            streamingController.stop()
//            playing = false
//        } else {
//            
//            streamingController.play()
//            playing = true
//            playButton.setTitle("Stop", for: .normal)
//        }
//    }

}
    
