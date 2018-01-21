//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Stephane Darcy SIMO MBA on 10/01/2018.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        loginButton.layer.cornerRadius = 5
        loginButton.layer.shadowOpacity = 3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isValidEmail(testStr: String) -> Bool {
        let regexExpress = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", regexExpress)
        return emailTest.evaluate(with: testStr)
    }
    
    // MARK: - TextField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    // Mark: - Action
    
    @IBAction func loginAction(_ sender: Any) {
        if ((emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! || !isValidEmail(testStr: emailTextField.text!)) {
            let alert = UIAlertController(title: "Error", message: "Please try again", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
            
            self.present(vc!, animated: true, completion: nil)
        }
    }
    

}
