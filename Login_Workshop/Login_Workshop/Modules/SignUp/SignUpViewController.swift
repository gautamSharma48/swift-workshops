//
//  SignUpViewController.swift
//  Login_Workshop
//
//  Created by Gautam Sharma on 19/06/23.
//

import Foundation
import UIKit

class SignUpViewController : UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var emailView:UIView!
    @IBOutlet weak var passwordView:UIView!
    @IBOutlet weak var confirmPassword:UIView!
    
    
    @IBOutlet weak var validIconEmail: UIImageView!
    @IBOutlet weak var validIconConfirmPassword: UIImageView!
    @IBOutlet weak var validIconPassword: UIImageView!
    
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        CommonUtils.commonLayout(viewName: userView)
        CommonUtils.commonLayout(viewName: emailView)
        CommonUtils.commonLayout(viewName: passwordView)
        CommonUtils.commonLayout(viewName: confirmPassword)
        
        validIconEmail.isHidden = true;
        validIconPassword.isHidden = true;
        validIconConfirmPassword.isHidden = true;
        
        userField.delegate = self;
        emailField.delegate = self;
        passwordField.delegate = self;
        confirmPasswordField.delegate = self;
        
        navigationItem.hidesBackButton = true
        
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
        SignUpUtils.signUpHandler(userField: userField, emailField: emailField, paswordField: passwordField, confirmPasswordField: confirmPasswordField, viewController:self)
    }
    
    @IBAction func btnLoginButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
