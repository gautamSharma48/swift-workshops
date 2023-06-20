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
    @IBOutlet weak var validEmail: UIImageView!
    @IBOutlet weak var validPassword: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configuration()
    }
    
    func configuration(){
        CommonUtils.commonLayout(viewName: emailFieldView );
        CommonUtils.commonLayout(viewName: passwordView );
        validEmail.isHidden=true;
        validPassword.isHidden=true;
        
        // Set delegate for emailField and passwordField
        emailField.delegate = self
        passwordField.delegate = self
        passwordField.isSecureTextEntry = true
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        LoginUtils.loginHandler(emailField: emailField, passwordField: passwordField,viewController: self);
    }
    
    @IBAction func btnSignUpButton(_ sender: UIButton) {
        if let VC = self.storyboard?.instantiateViewController(identifier : "SignUpViewController") as? SignUpViewController {
            self.navigationController?.pushViewController(VC, animated: true);
        }
    }
    
}

