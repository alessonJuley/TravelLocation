//
//  RegisterViewController.swift
//  AbaoTravelLocationProject
//
//  This view controller deals with register user. This page stores data by "zipping"
//  the data and store this "zipped" data in user defaults
//
//  This view controller is connected to User.swift
//
//  I used this YouTube tutorial as reference:
//  https://www.youtube.com/watch?v=5Rn6JJAuyK0&t=183s&ab_channel=CodeWithCal
//
//  Created by Alesson Abao on 10/7/22 for mobile application development project
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var addressErrorLabel: UILabel!
    @IBOutlet weak var numberErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var register: UIButton!
    
    /*============================local functions===============================*/
    // function for what the form should look like after the user registers
    func resetForm()
    {
        // outlet register button is disabled so the user will not submit the form
        register.isEnabled = false
        
        // Error labels are shown
        nameErrorLabel.isHidden = false
        addressErrorLabel.isHidden = false
        numberErrorLabel.isHidden = false
        emailErrorLabel.isHidden = false
        usernameErrorLabel.isHidden = false
        passwordErrorLabel.isHidden = false
        // Error labels tells the user that all text fields are required to be filled up
        nameErrorLabel.text = "Required"
        addressErrorLabel.text = "Required"
        numberErrorLabel.text = "Required"
        emailErrorLabel.text = "Required"
        usernameErrorLabel.text = "Required"
        passwordErrorLabel.text = "Required"
        // Empty out the text field inputs
        nameTextField.text = ""
        addressTextField.text = ""
        numberTextField.text = ""
        emailTextField.text = ""
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    // check if text field inputs are valid
    func checkForValidForm()
    {
        // if there are no errors
        if nameErrorLabel.isHidden && addressErrorLabel.isHidden && numberErrorLabel.isHidden && emailErrorLabel.isHidden && usernameErrorLabel.isHidden && passwordErrorLabel.isHidden
        {
            // allow the user to submit the form by enabling the register button
            register.isEnabled = true
        }
        else
        {
            // do not allow the user to submit until all user inputs are filled up
            register.isEnabled = false
        }
    }
    /*==========================end of local functions===========================*/

    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
    }
    
    // when user tries to register
    @IBAction func registerButton(_ sender: UIButton) {
        // text field input from user
        let name = nameTextField.text!
        let address = addressTextField.text!
        let number = Int(numberTextField.text!)
        let email = emailTextField.text!
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        // create a user object to store them in the user defaults
        let userObject = User(name: name, address: address, number: number!, email: email, username: username, password: password)
        // compress object
        let data = try! NSKeyedArchiver.archivedData(withRootObject: userObject, requiringSecureCoding: false)
        // put compressed object in UserDefaults
        UserDefaults.standard.set(data, forKey: "user")
        
        // let the user know that their info is stored in user defaults (local database)
        showMessage(msg: "Account Registered 🎉", buttonCaption: "Go back to login", controller: self)
        // clear out the form for another registration
        resetForm()
    }
    
    // when user input types, the error message changes (messange changed or removed)
    @IBAction func nameChanged(_ sender: Any) {
        if let name = nameTextField.text
        {
            // check if the name has more than 1 character, incorrect input will go to if
            if let errorMessage = invalidName(name)
            {
                nameErrorLabel.text = errorMessage
                nameErrorLabel.isHidden = false
            }
            else
            {
                nameErrorLabel.isHidden = true
            }
        }
        // if input is correct, error label will be hidden
        checkForValidForm()
    }
    
    @IBAction func addressChanged(_ sender: Any) {
        if let address = addressTextField.text
        {
            // check if the address has the correct format, incorrect input will go to if
            if let errorMessage = invalidAddress(address)
            {
                addressErrorLabel.text = errorMessage
                addressErrorLabel.isHidden = false
            }
            else
            {
                addressErrorLabel.isHidden = true
            }
        }
        // if input is correct, error label will be hidden
        checkForValidForm()
    }
    
    @IBAction func numberChanged(_ sender: Any) {
        if let number = numberTextField.text
        {
            // check if the number has int and 9 numbers, incorrect input will go to if
            if let errorMessage = invalidNumber(number)
            {
                numberErrorLabel.text = errorMessage
                numberErrorLabel.isHidden = false
            }
            else
            {
                numberErrorLabel.isHidden = true
            }
        }
        // if input is correct, error label will be hidden
        checkForValidForm()
    }
    
    @IBAction func emailChanged(_ sender: Any) {
        if let email = emailTextField.text
        {
            // check if the email has the correct format, incorrect input will go to if
            if let errorMessage = invalidEmail(email)
            {
                emailErrorLabel.text = errorMessage
                emailErrorLabel.isHidden = false
            }
            else
            {
                emailErrorLabel.isHidden = true
            }
        }
        // if input is correct, error label will be hidden
        checkForValidForm()
    }
    
    @IBAction func usernameChanged(_ sender: Any) {
        if let username = usernameTextField.text
        {
            // check if username has at least 5 characters, incorrect input will go to if
            if let errorMessage = invalidUsername(username)
            {
                usernameErrorLabel.text = errorMessage
                usernameErrorLabel.isHidden = false
            }
            else
            {
                usernameErrorLabel.isHidden = true
            }
        }
        // if input is correct, error label will be hidden
        checkForValidForm()
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        if let password = passwordTextField.text
        {
            // check if password has at least 8 characters and 1 number, incorrect input will go to if
            if let errorMessage = invalidPassword(password)
            {
                passwordErrorLabel.text = errorMessage
                passwordErrorLabel.isHidden = false
            }
            else
            {
                passwordErrorLabel.isHidden = true
            }
        }
        // if input is correct, error label will be hidden
        checkForValidForm()
    }
}
