//
//  WifiView.swift
//  pi_cam
//
//  Created by Marquavious on 12/1/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class WifiView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = UIColor.gray
        
        view.addSubview(tableView)
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        print(view.centerXAnchor)
        
        tableView.isUserInteractionEnabled = true
    }
    
    let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = UIColor.red
        tableView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return tableView
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }

}
