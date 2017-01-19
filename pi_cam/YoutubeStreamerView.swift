//
//  YoutubeStreamerView.swift
//  pi_cam
//
//  Created by Marquavious on 1/17/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class YoutubeStreamerView: UIView {
    var url: URL?
    var screenHight: Int = 0
    var screenWidth: Int = 0
    
    
    @IBOutlet weak var webView: UIWebView!
    override func awakeFromNib() {
        screenHight = Int(self.bounds.height)
        screenWidth = Int(self.bounds.width)

//        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        

//        webView.translatesAutoresizingMaskIntoConstraints = false
        
        print("Height-> \(screenHight)  Width-> \(screenWidth)")
        
//        url = URL(string: "https://www.youtube.com/watch?v=pCZeVTMEsik")
//        let request = URLRequest(url: url!)
//        webView.loadRequest(request)
        
        webView.allowsInlineMediaPlayback = true
        
        // add ?playsinline=1 to your YouTube video URL
//        667
//        375
        
        var b = "<html><body><iframe src=\"http://www.youtube.com/embed/UIYSY3EHgNY?playsinline=1\" width=\"360\" height=\"650\" frameborder=\"0\" allowfullscreen></iframe></body></html>"
        
        var a = "<html><body><iframe src=\"http://www.youtube.com/embed/s98vEkSJd4Y?playsinline=1\" width=\"" + String(screenWidth) + " height=\""+String(screenHight)+"\" frameborder=\"0\" allowfullscreen></iframe></body></html>"
        
        let embededHTML = b
        
          webView.loadHTMLString(embededHTML, baseURL: Bundle.main.bundleURL)
    
    
            
//            
            "<html><body><iframe src=\"http://www.youtube.com/embed/s98vEkSJd4Y?playsinline=1\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen></iframe></body></html>"
        
        
        
        
//        let flippedImage = UIImage()?.rotated(by: 48.0, flipped: true)

        
        
        
        
//        https://www.youtube.com/embed/pCZeVTMEsik?playsinline=1\%22%20width=\%22560\%22%20height=\%22315\%22%20frameborder=\%220\%22%20allowfullscreen
        
//        webView.loadHTMLString(atol, baseURL: Bundle.main.bundleURL)
        
//        webView.loadHTMLString(embededHTML, baseURL: Bundle.main.bundleURL)
        
    }
}
