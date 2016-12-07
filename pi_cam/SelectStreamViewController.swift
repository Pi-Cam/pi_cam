//
//  SelectStreamViewController.swift
//  pi_cam
//
//  Created by Marquavious on 12/4/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class SelectStreamViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPresssed(_ sender: Any) {
        let viewController: SelectWifiViewController = self.storyboard?.instantiateViewController(withIdentifier: "SelectWifi") as! SelectWifiViewController
        self.present(viewController, animated: true, completion: nil)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "streamCell", for: indexPath) as? StreamCell {
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}
