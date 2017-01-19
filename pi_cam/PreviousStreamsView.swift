//
//  PreviousStreamsView.swift
//  pi_cam
//
//  Created by Marquavious on 1/18/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class PreviousStreamsView: UIView, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! PreviousStreamsTableViewCell
        if indexPath[1] == 1{
            cell.statusView.backgroundColor = UIColor(red: 117/225, green: 169/225, blue: 40/225, alpha: 1)
            cell.streamTitle.text = "Ngrok"
            cell.streamDate.text = "1 - 25 - 2017"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func awakeFromNib() {
        let nib = UINib(nibName: "PreviousStreamsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 5
        tableView.clipsToBounds = true
        addBorder(view: tableView, width: 0.5)
    }
    
    func addBorder(view:UIView, width:Float){
        view.frame = view.frame.insetBy(dx: -(CGFloat)(width), dy: -(CGFloat)(width));
        view.layer.borderColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1).cgColor
        view.layer.borderWidth = CGFloat(width);
    }
}
