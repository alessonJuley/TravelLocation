//
//  AddSiteViewController.swift
//  AbaoTravelLocationProject
//
//  This controller mainly unzips the current site array, add a new element,
//  rewrite the whole content of site array, and zipping it again in the user defaults
//
//  This view controller is connected to Site.swift
//
//  Created by Alesson Abao on 10/7/22 for mobile application development project
//

import UIKit

class AddSiteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    @IBOutlet weak var siteNameTextField: UITextField!
    @IBOutlet weak var siteAddressTextField: UITextField!
    @IBOutlet weak var siteDescriptionTextField: UITextField!
    @IBOutlet weak var picView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resetForm()
    {
        siteNameTextField.text = ""
        siteAddressTextField.text = ""
        siteDescriptionTextField.text = ""
        picView.image = nil
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        // you want to make a variable to allow the user get some images
        let picker = UIImagePickerController()
        // you do not allow editing when the user choose an image
        picker.allowsEditing = false
        // you are only allowing the user to get images in their photo library
        picker.sourceType = .photoLibrary
        // you are telling that this image picker controller will be in AddSiteViewController
        picker.delegate = self
        // show the picker here using present
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // you are turning the image into a variable
        let image = info[.originalImage] as! UIImage
        // you are passing this image (what the user picked) to the picView (the imageView in the front-end)
        picView.image = image
        // you want the photo gallery to automatically close/dismiss once the user picks an image
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addSite(_ sender: UIButton) {
        let siteName = siteNameTextField.text!
        let siteAddress = siteAddressTextField.text!
        let siteDescription = siteDescriptionTextField.text!
        let picView = picView.image!
        let dateSaved = getDate()

        // creating a Site object
        let site = Site(siteName: siteName, siteAddress: siteAddress, siteDescription: siteDescription, siteImg: picView, dateSaved: dateSaved)
        // calling the readData method means that you are unarchiving the object from the User Defaults
        var siteList = readData()
        // you are adding new site in the current site array list
        siteList.append(site)
        
        // Add data in UserDefaults by zipping it
        let data = try! NSKeyedArchiver.archivedData(withRootObject: siteList, requiringSecureCoding: false )
        // Re-write the whole site array with the new data
        UserDefaults.standard.set(data, forKey: "site")
        
        showMessage(msg: "New Site Added 🥳", buttonCaption: "Close", controller: self)
        resetForm()
    }
}
