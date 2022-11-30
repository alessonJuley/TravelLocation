//
//  LoginViewController.swift
//  AbaoTravelLocationProject
//
//  This view controller deals with user login. This page gets data from user defaults
//  and "unzips" the data to validate user input
//
//  This view controller is connected to User.swift
//
//  Created by Alesson Abao on 10/7/22 for mobile application development project
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        // create variables for textfield input
        let loginUsername = usernameTextField.text
        let loginPassword = passwordTextField.text

        // get value from UserDefaults (compressed version from register)
        let data = UserDefaults.standard.value(forKey: "user") as! Data
        // decompress value when you get data from UserDefaults
        let user = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! User
        // check if input has the correct pair of username and password from user defaults
        if(loginUsername == user.username && loginPassword == user.password)
        {
            // for validation: print user info
            print(user.name)
            print(user.address)
            print(user.number)
            print(user.email)
            print(user.username)
        }
        // if input is wrong (based on user default), show pop-up screen
        else
        {
            showMessage(msg: "Username and password must match 😔", buttonCaption: "Try again", controller: self)
        }
    }
}
