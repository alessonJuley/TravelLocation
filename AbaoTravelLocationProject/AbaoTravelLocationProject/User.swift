//
//  User.swift
//  AbaoTravelLocationProject
//
//  "Brain" for user registration and login
//
//  I used this YouTube tutorial as reference:
//  https://www.youtube.com/watch?v=5Rn6JJAuyK0&t=183s&ab_channel=CodeWithCal
//
//  Created by Alesson Abao on 10/7/22 for mobile application development project
//

import Foundation

// register: name validation
func invalidName (_ value : String) -> String?
{
    if value.count < 1
    {
        return "Please enter your full name"
    }
    
    return nil // no error at this point
}

// register: address validation
func invalidAddress (_ value : String) -> String?
{
    let addressRegEx = #"^[#.0-9a-zA-Z\s,-]+$"#
    
    let predicate = NSPredicate(format: "SELF MATCHES %@", addressRegEx)
    
    if !predicate.evaluate(with: value)
    {
        return "Invalid address"
    }
    
    return nil // no error at this point
}

// register: number validation
func  invalidNumber(_ value : String) -> String?
{
    let set = CharacterSet(charactersIn: value)
        
    if !CharacterSet.decimalDigits.isSuperset(of: set)
    {
        return "Phone number must contain only digits"
    }
    else if value.count != 9
    {
        return "Phone number must be 9 digits (02xxxxxxx)"
    }
    
    return nil // no error at this point
}

// register: email validation
func invalidEmail (_ value : String) -> String?
{
    let emailRegEx = #"^\S+@\S+\.\S+$"#
    let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    
    if !predicate.evaluate(with: value)
    {
        return "Invalid Email address"
    }
    
    return nil // no error at this point
}

// register: username validation
func invalidUsername (_ value : String) -> String?
{
    if value.count < 5
    {
        return "Username should at least have 5 letters"
    }
    
    return nil // no error at this point
}

// register: password validation
func invalidPassword (_ value : String) -> String?
{
    if value.count < 8
    {
        return "Password must contain at least 8 characters"
    }
    else if containsDigit(value)
    {
        return "Password must contain at least 1 number"
    }
    
    return nil // no error at this point
}

// register: password validation 2
func containsDigit(_ value : String) -> Bool
{
    let regEx = ".*[0-9].*"
    let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
    
    return !predicate.evaluate(with: value)
}

// user info to be saved
class User: NSObject, NSCoding
{
    // compress object to get from UserDefaults (like a zip file)
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(address, forKey: "address")
        coder.encode(number, forKey: "number")
        coder.encode(email, forKey: "email")
        coder.encode(username, forKey: "username")
        coder.encode(password, forKey: "password")
    }
    // decompress object to get real data from UserDefaults (like extracting a zip file)
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        address = coder.decodeObject(forKey: "address") as! String
        number = coder.decodeInteger(forKey: "number")
        email = coder.decodeObject(forKey: "email") as! String
        username = coder.decodeObject(forKey: "username") as! String
        password = coder.decodeObject(forKey: "password") as! String
    }
    
    // variables for user we want to store
    var name : String
    var address : String
    var number : Int
    var email : String
    var username : String
    var password : String
    
    // constructor so values doesn't become nil
    init(name: String, address: String, number: Int, email: String, username: String, password: String)
    {
        self.name = name
        self.address = address
        self.number = number
        self.email = email
        self.username = username
        self.password = password
    }
}
