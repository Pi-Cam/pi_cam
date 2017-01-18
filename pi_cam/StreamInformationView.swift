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
    
    @IBOutlet weak var transformingTextLabelTwo: UILabel!
    var timer = Timer()
        var counter = 0
        var IndexCounter = 0

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
        //let borderWidth: CGFloat = 0.5
        //        borderView.frame = self.frame.insetBy(dx: CGFloat(-borderWidth), dy: CGFloat(-borderWidth))
        //        borderView.layer.borderColor = UIColor.gray.cgColor
        //        borderView.layer.borderWidth = borderWidth;
        
    }
    
    //    @IBAction func goLiveButton(_ sender: Any) {
    //        mainViewController.performSegue(withIdentifier: "goLive", sender: self)
    //    }
    
    
    
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
