//
//  SiteTableViewCell.swift
//  AbaoTravelLocationProject
//
//  reference for SiteTableViewController's cell
//  This view controller is connected to SiteTableViewController.swift
//
//  Created by Alesson Abao on 10/7/22 for mobile application development project
//

import UIKit

class SiteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var picView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
