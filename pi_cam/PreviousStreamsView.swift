//
//  PreviousStreamsView.swift
//  pi_cam
//
//  Created by Marquavious on 1/18/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class PreviousStreamsView: UIView {
    @IBOutlet weak var tableView: UITableView!
    
//    var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
    
//    let nib = UINib(nibName: "cell", bundle: nil)
//    tableView.register(nib, forCellWithReuseIdentifier: "cell")

//    override func didMoveToSuperview() {
////        tableView.delegate = self
////        tableView.dataSource = self
////        let nib = UINib(nibName: "PreviousStreamsView", bundle: nil)
////        tableView.register(nib, forCellReuseIdentifier: "cell")
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! PreviousStreamsTableViewCell
////        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PreviousStreamsTableViewCell
//        
//        return cell
//    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return 4
//    }
//    
    
    override func awakeFromNib() {
//     tableView.delegate = self
//    tableView.dataSource = self
//        let nib = UINib(nibName: "PreviousStreamsView", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
}
