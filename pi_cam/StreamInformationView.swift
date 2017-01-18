//
//  StreamInformationView.swift
//  pi_cam
//
//  Created by Marquavious on 1/10/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class StreamInformationView: UIView {
    
    @IBOutlet weak var transformingTextLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var startStreamButton: UIButton!
    @IBOutlet weak var transformingTextLabelTwo: UILabel!
    var timer = Timer()
        var counter = 0
        var IndexCounter = 0

    @IBOutlet weak var streamerPicture: UIImageView!
        var coolWords = ["Last Stream","Number of streams","Average view count"]
    var coolWordsTwo = ["Dec 7, 9:00pm","145","76"]
    
    @IBOutlet weak var borderView: UIView!
    var mainViewController: HomeScreenController!
    
    @IBOutlet weak var streamingService: UIImageView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override func awakeFromNib() {
        
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: "countUp", userInfo: nil, repeats: true)
        
        
//        var borderWidth: CGFloat = 0.5
//        
//        streamerPicture.frame = streamerPicture.frame.insetBy(dx: -borderWidth, dy: -borderWidth);
//        streamerPicture.layer.borderColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1).cgColor
//        streamerPicture.layer.borderWidth = borderWidth;
        
        addBorder(view: streamerPicture, width: 0.5)
        addBorder(view: startStreamButton, width: 0.5)
        addBorder(view: editButton, width: 0.5)

        
        
        //let borderWidth: CGFloat = 0.5
        //        borderView.frame = self.frame.insetBy(dx: CGFloat(-borderWidth), dy: CGFloat(-borderWidth))
        //        borderView.layer.borderColor = UIColor.gray.cgColor
        //        borderView.layer.borderWidth = borderWidth;
        
    }
    
    //    @IBAction func goLiveButton(_ sender: Any) {
    //        mainViewController.performSegue(withIdentifier: "goLive", sender: self)
    //    }
    
    
    func addBorder(view:UIView, width:Float){
        view.frame = view.frame.insetBy(dx: -(CGFloat)(width), dy: -(CGFloat)(width));
        view.layer.borderColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1).cgColor
        view.layer.borderWidth = CGFloat(width);
    }
    
    
    func countUp(){
        counter += 1
        print(counter)
        
        if (counter > 1 && counter % 2 == 0) {
            UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.transformingTextLabel.alpha = 1
                self.transformingTextLabelTwo.alpha = 1
                if self.IndexCounter > self.coolWords.count-1{
                    self.IndexCounter = 0
                    self.transformingTextLabel.text = self.coolWords[self.IndexCounter]
                    self.transformingTextLabelTwo.text = self.coolWords[self.IndexCounter]
                }
                self.transformingTextLabel.text = self.coolWords[self.IndexCounter]
                self.transformingTextLabelTwo.text = self.coolWordsTwo[self.IndexCounter]
                
            }, completion: nil)
            
        } else {
            
            UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.transformingTextLabel.alpha = 0
                self.transformingTextLabelTwo.alpha = 0
                self.IndexCounter += 1
                
            }, completion: nil)
            
        }
    }
    
    
}
