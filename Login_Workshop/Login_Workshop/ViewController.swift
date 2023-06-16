//
//  ViewController.swift
//  Login_Workshop
//
//  Created by Gautam Sharma on 15/06/23.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    //textField layouts
    @IBOutlet weak var emailFieldView: UIView!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordStack: UIStackView!

    // right or wrong icon for input field
    @IBOutlet weak var invalidEmail: UIImageView!
    @IBOutlet weak var validEmail: UIImageView!
    @IBOutlet weak var invalidPassword: UIImageView!
    @IBOutlet weak var validPassword: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LoginController.commonLayout(viewName: emailFieldView, stackName: emailStackView);
        LoginController.commonLayout(viewName: passwordView, stackName: passwordStack);
        validEmail.isHidden=true;
        invalidEmail.isHidden=true;
        validPassword.isHidden=true;
        invalidPassword.isHidden=true;
        
        // Set delegate for emailField and passwordField
              emailField.delegate = self
              passwordField.delegate = self
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        LoginController.loginHandler(emailField: emailField, passwordField: passwordField,viewController: self);
    }
    
}
   
