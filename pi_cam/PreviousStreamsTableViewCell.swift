//
//  PreviousStreamsTableViewCell.swift
//  pi_cam
//
//  Created by Marquavious on 1/18/17.
//  Copyright © 2017 marqmakesapps. All rights reserved.
//

import UIKit

class PreviousStreamsTableViewCell: UITableViewCell {
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var streamTitle: UILabel!

    @IBOutlet weak var streamDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
