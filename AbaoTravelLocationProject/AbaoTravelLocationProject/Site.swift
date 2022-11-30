//
//  Site.swift
//  AbaoTravelLocationProject
//
//  "Brain" for adding of site, searching of sites, and getting current date
//
//  I used this YouTube tutorial as reference for the search controller:
//  https://www.youtube.com/watch?v=iH67DkBx9Jc&ab_channel=AjayGandecha
//
//  I used this YouTube tutorial as reference for getting the current date:
//  https://www.youtube.com/watch?v=HSFTzcYzuEQ&ab_channel=iOSAcademy
//
//  Created by Alesson Abao on 10/7/22 for mobile application development project
//

import Foundation
import UIKit

// pop-up message function
func showMessage(msg: String, buttonCaption: String, controller: UIViewController)
{
    let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
    let action = UIAlertAction(title: buttonCaption, style: .default)
    
    alert.addAction(action)
    controller.present(alert, animated: true, completion: nil)
}

// get current date and turn it into a string
func getDate() -> String
{
    // get current date
    let dateObject = Date()
    // formatted date
    let dateFormatter = DateFormatter()
    // Format of date: Month 00, 2022
    dateFormatter.timeStyle = .none
    dateFormatter.dateStyle = .long
    dateFormatter.timeZone = .current
    dateFormatter.locale = .current
    // October 3, 2022
    dateFormatter.dateFormat = "MMMM d, yyyy"
    // convert dateObject into a string
    return dateFormatter.string(from: dateObject)
}

// return the existing data in the array list
func readData() -> [Site]
{
    // there's data in the UserDefaults
    if UserDefaults.standard.value(forKey: "site") != nil
    {
        let data = UserDefaults.standard.value(forKey: "site") as! Data
        // like unzipping a file
        let sites = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Site]
        // returning the unzipped data
        return sites
    }
    else
    {
        // if the User Defaults is empty just return the empty object array
        return [Site]()
    }
}

class Site: NSObject, NSCoding
{
    func encode(with coder: NSCoder) {
        coder.encode(siteName, forKey: "siteName")
        coder.encode(siteAddress, forKey: "siteAddress")
        coder.encode(siteDescription, forKey: "siteDescription")
        coder.encode(siteImg, forKey: "siteImg")
        coder.encode(dateSaved, forKey: "dateSaved")
    }
    
    required init?(coder: NSCoder) {
        siteName = coder.decodeObject(forKey: "siteName") as! String
        siteAddress = coder.decodeObject(forKey: "siteAddress") as! String
        siteDescription = coder.decodeObject(forKey: "siteDescription") as! String
        siteImg = coder.decodeObject(forKey: "siteImg") as! UIImage
        dateSaved = coder.decodeObject(forKey: "dateSaved") as! String
    }
    // what you want to save under site
    var siteName : String
    var siteAddress : String
    var siteDescription : String
    var siteImg : UIImage
    var dateSaved : String
    // initializer
    init(siteName: String, siteAddress: String, siteDescription: String, siteImg: UIImage, dateSaved: String)
    {
        self.siteName = siteName
        self.siteAddress = siteAddress
        self.siteDescription = siteDescription
        self.siteImg = siteImg
        self.dateSaved = dateSaved
    }
}
