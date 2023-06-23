//
//  SignUp.swift
//  Login_Workshop
//
//  Created by Gautam Sharma on 19/06/23.
//

import Foundation
import UIKit


class SignUpUtils {
    
    static func signUpHandler(userField: UITextField,emailField: UITextField,paswordField: UITextField,confirmPasswordField: UITextField , viewController:UIViewController){
        
        guard let user = userField.text ,let email = emailField.text,
              let password = paswordField.text , let confirmPassword = confirmPasswordField.text  else {
            viewController.openAlert(title: "Alert", message: "Please add details.")
            return
        }
        
        if user.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            viewController.openAlert(title: "Alert", message: "Please add details.")
            return
        }
        
        if !email.validateEmail() {
            viewController.openAlert(title: "Alert", message: "Please enter valid email.")
            return
        }
        
        if !password.validatePassword() || !confirmPassword.validatePassword() {
            viewController.openAlert(title: "Alert", message: "Please enter valid password")
            return
        }
        
        //navigate to home screen
        if let VC = viewController.storyboard?.instantiateViewController(identifier : "HomeViewController") as? HomeViewController {
            viewController.navigationController?.pushViewController(VC, animated: true);
        }
    }
}

extension SignUpViewController{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let checkPassword : Bool =  textField == passwordField
        if textField == emailField {
            validateEmail(textField: textField, range: range, string: string)
        } else if checkPassword || textField == confirmPasswordField {
            validatePassword(textField: textField, range: range, string: string, icon :checkPassword ? validIconPassword : validIconConfirmPassword)
        }
        return true
    }
    
    func validateEmail(textField: UITextField, range: NSRange, string: String) {
        let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if updatedText.isEmpty {
            validIconEmail.isHidden = true
        } else if updatedText.validateEmail() {
            validIconEmail.isHidden = false;
            validIconEmail.image = UIImage(named:"check")
        } else {
            validIconEmail.isHidden = false
            validIconEmail.image = UIImage(named:"wrong")
        }
    }
    
    func validatePassword(textField: UITextField, range: NSRange, string: String , icon : UIImageView) {
        let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if updatedText.isEmpty {
            icon.isHidden = true
        } else if updatedText.validatePassword() {
            icon.isHidden = false
            icon.image = UIImage(named: "check")
        } else {
            icon.isHidden = false
            icon.image = UIImage(named: "wrong")
        }
    }
    
}
