//
//  SiteDetailsViewController.swift
//  AbaoTravelLocationProject
//
//  this view controller mainly handles showing of data
//  This view controller is connected to SiteTableViewController.swift
//
//  Created by Alesson Abao on 10/7/22 for mobile application development project
//
import Foundation
import UIKit

class SiteDetailsViewController: UIViewController {
    
    @IBOutlet weak var siteNameLabel: UILabel!
    @IBOutlet weak var siteAddressLabel: UILabel!
    @IBOutlet weak var siteImage: UIImageView!
    @IBOutlet weak var siteDescriptionLabel: UILabel!
    // this variable can be seen in SitesTableViewController
    var selectedSite : Site! 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        siteNameLabel.text! += selectedSite.siteName
        siteAddressLabel.text! = " 📍  " + selectedSite.siteAddress
        
        siteImage.image = selectedSite.siteImg
        siteDescriptionLabel.text! += selectedSite.siteDescription
    }
}
