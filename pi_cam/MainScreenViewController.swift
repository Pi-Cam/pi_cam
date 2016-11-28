//
//  MainScreenViewController.swift
//  pi_cam
//
//  Created by Marquavious on 11/27/16.
//  Copyright © 2016 marqmakesapps. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "streamingServicerCell") as! StreamingServiceTableViewCell
        
        return cell
    }

}
