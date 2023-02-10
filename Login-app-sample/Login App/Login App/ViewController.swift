//
//  ViewController.swift
//  Login App
//
//  Created by Igor Astsatryan on 10.11.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var loginOrRegister: UISegmentedControl!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var phoneNumberTxtFld: UITextField!
    @IBOutlet weak var phoneNumberLabel: UILabel!

    
    var loginMode = true
    var passwordHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneNumberTxtFld.isHidden = true
        phoneNumberLabel.isHidden = true
        notificationLabel.isHidden = true
        nameLabel.isHidden = true
        nameTxtField.isHidden = true
        
        
    }
    
    func secondPage() {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "NavigateOnSignViewController") as! UINavigationController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    @IBAction func forgotPassword(_ sender: Any) {
        
    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        if loginMode { //login
            let email = emailTxtFld.text
            let pass = passwordTxtFld.text
            if email == "example@gmail.com" && pass == "pass123" {
                notificationLabel.isHidden = false
                notificationLabel.text = "Success!"
                notificationLabel.backgroundColor = .systemGreen
            } else {
                notificationLabel.isHidden = false
                notificationLabel.text = "Failed"
                notificationLabel.backgroundColor = .systemRed
            }
        } else { //register
            let email = emailTxtFld.text
            let phoneNumber = phoneNumberTxtFld.text
            let pass = passwordTxtFld.text
            
            if email == "" || phoneNumber == "" || pass == "" { // checking txtFields
                notificationLabel.isHidden = false
                notificationLabel.text = "All fields are neccessary!"
                notificationLabel.backgroundColor = .systemOrange
            } else {
                
                    notificationLabel.isHidden = false
                    notificationLabel.text = "Register success!"
                    notificationLabel.backgroundColor = .systemGreen
                
            }
        }
        
        emailTxtFld.resignFirstResponder()
        phoneNumberTxtFld.resignFirstResponder()
        passwordTxtFld.resignFirstResponder()
        
        emailTxtFld.text = ""
        phoneNumberTxtFld.text = ""
        passwordTxtFld.text = ""
        
    }
    
    @IBAction func SwitchToLoginOrRegister(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            loginMode = true    // login mode
            phoneNumberTxtFld.isHidden = true
            phoneNumberLabel.isHidden = true
            nameLabel.isHidden = true
            nameTxtField.isHidden = true
            mainButton.setTitle("Sign in", for: UIControl.State.normal)
        } else {
            loginMode = false   // register mode
            phoneNumberTxtFld.isHidden = false
            phoneNumberLabel.isHidden = false
            nameLabel.isHidden = false
            nameTxtField.isHidden = false
            mainButton.setTitle("Register", for: UIControl.State.normal)
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        
    }
    
    @IBAction func revealPassword(_ sender: UIButton) {
        if passwordHidden {
            passwordHidden = false // reveal
            sender.setImage( UIImage(systemName: "eye.fill"), for: UIControl.State.normal)
            passwordTxtFld.isSecureTextEntry = false
        } else { // hidden
            passwordHidden = true
            sender.setImage(UIImage(systemName: "eye.slash.fill"), for: UIControl.State.normal)
            passwordTxtFld.isSecureTextEntry = true
        }
    }
    
}

