//
//  StreamVC.swift
//  pi_cam
//
//  Created by Marquavious on 12/15/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit
//import MediaPlayer


class StreamVC: UIViewController {
    @IBOutlet weak var webView: UIWebView!

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        webView.scalesPageToFit = false
//        let url = NSURL(string: "https://pistream.ngrok.io/stream")
//        let request = NSURLRequest(url: url! as URL)
//        webView.loadRequest(request as URLRequest)
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        webView.scalesPageToFit = false
        webView.isUserInteractionEnabled = false
        let url = NSURL(string: "https://pistream.ngrok.io/stream/video.mjpeg")
        let request = NSURLRequest(url: url! as URL)
        webView.loadRequest(request as URLRequest)
        
        
//        let imageView = UIImageView(frame: rect)
//        let streamingController = MjpegStreamingController(imageView: imageView)
//        // To play url do:
//        let url = NSURL(string: "http://mjpeg.streaming.url/movie.mjpeg")
//        streamingController.play(url: url!)

        
    }
    
//    var moviePlayer:MPMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url:NSURL = NSURL(string: "https://pistream.ngrok.io/stream/video.mjpeg")!
        
//        moviePlayer = MPMoviePlayerController(contentURL: url as URL!)
//        moviePlayer.view.frame = CGRect(x: 20, y: 100, width: 200, height: 150)
//        
//        self.webView.addSubview(moviePlayer.view)
//        moviePlayer.isFullscreen = true
//        
//        moviePlayer.controlStyle = MPMovieControlStyle.embedded
        
    }

}
