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
    var screenHight: Int = 0
    var screenWidth: Int = 0
    
    var streamingController: MjpegStreamingController!
    @IBOutlet weak var imageView: UIImageView!
    

    override func awakeFromNib() {
        
        screenHight = Int(self.bounds.height)
        screenWidth = Int(self.bounds.width)
        
        print(screenWidth)
        print(screenHight)
        
//        _ = DotLoder(frame: 0, masterView: self, counter: 2, height: 0)
      
        // Check for index
        
        imageView.widthAnchor.constraint(equalToConstant: CGFloat(screenHight)).isActive = true
        
         imageView.heightAnchor.constraint(equalToConstant: CGFloat(screenWidth)).isActive = true
        
        
        imageView.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2));

        streamingController = MjpegStreamingController(imageView: imageView)
        url = URL(string: "http://pistream.ngrok.io/stream/video.mjpeg")
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

extension Double {
    func toRadians() -> CGFloat {
        return CGFloat(self * .pi / 180.0)
    }
}

extension UIImage {
    func rotated(by degrees: Double, flipped: Bool = false) -> UIImage? {
        guard let cgImage = self.cgImage else { return nil }
        
        let transform = CGAffineTransform(rotationAngle: degrees.toRadians())
        var rect = CGRect(origin: .zero, size: self.size).applying(transform)
        rect.origin = .zero
        
        let renderer = UIGraphicsImageRenderer(size: rect.size)
        return renderer.image { renderContext in
            renderContext.cgContext.translateBy(x: rect.midX, y: rect.midY)
            renderContext.cgContext.rotate(by: degrees.toRadians())
            renderContext.cgContext.scaleBy(x: flipped ? -1.0 : 1.0, y: -1.0)
            
            let drawRect = CGRect(origin: CGPoint(x: -self.size.width/2, y: -self.size.height/2), size: self.size)
            renderContext.cgContext.draw(cgImage, in: drawRect)
        }
    }
}
