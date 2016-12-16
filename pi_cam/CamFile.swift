//
//  CamFile.swift
//  pi_cam
//
//  Created by Marquavious on 12/15/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit
import MediaPlayer

class VideoViewController: UIViewController {
    
    var moviePlayer:MPMoviePlayerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url:NSURL = NSURL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")!
        
        moviePlayer = MPMoviePlayerController(contentURL: url as URL!)
        moviePlayer.view.frame = CGRect(x: 20, y: 100, width: 200, height: 150)
        
        self.view.addSubview(moviePlayer.view)
        moviePlayer.isFullscreen = true
        
        moviePlayer.controlStyle = MPMovieControlStyle.embedded
        
    }
}
