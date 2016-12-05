//
//  SelectStreamViewController.swift
//  pi_cam
//
//  Created by Marquavious on 12/4/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class SelectStreamViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        

        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "streamCell", for: indexPath)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    @IBAction func backButtonPresssed(_ sender: Any) {
        let viewController: SelectWifiViewController = self.storyboard?.instantiateViewController(withIdentifier: "SelectWifi") as! SelectWifiViewController
        self.present(viewController, animated: true, completion: nil)
        
        
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 115, height: 125)
//    }

}
