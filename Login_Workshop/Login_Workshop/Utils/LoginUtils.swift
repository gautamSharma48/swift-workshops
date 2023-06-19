//
//  LoginLayout.swift
//  Login_Workshop
//
//  Created by Gautam Sharma on 16/06/23.
//

import Foundation
import UIKit


class LoginUtils  {
    
    

    
    static func loginHandler(emailField : UITextField , passwordField : UITextField, viewController : UIViewController){
        guard let email = emailField.text, let password = passwordField.text else {
            viewController.openAlert(title: "Alert", message: "Please add details.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay clicked!")
            }])
            return
        }
        
        if email.isEmpty || password.isEmpty {
            viewController.openAlert(title: "Alert", message: "Please add details.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay clicked!")
            }])
            return
        }
        
        if !email.validateEmail() {
            viewController.openAlert(title: "Alert", message: "Please enter a valid email.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay clicked!")
            }])
            return
        }
        
        if !password.validatePassword() {
            viewController.openAlert(title: "Alert", message: "Please enter a valid password.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay clicked!")
            }])
            return
        }
        
        // Navigation - Home Screen
        if let VC = viewController.storyboard?.instantiateViewController(identifier : "HomeViewController") as? HomeViewController {
            viewController.navigationController?.pushViewController(VC, animated: true);
        }
    }
    
}


extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailField {
            validateEmail(textField: textField, range: range, string: string)
        } else if textField == passwordField {
            validatePassword(textField: textField, range: range, string: string)
        }
        return true
    }
    
    func validateEmail(textField: UITextField, range: NSRange, string: String) {
        let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if updatedText.isEmpty {
            validEmail.isHidden = true
        } else if updatedText.validateEmail() {
            validEmail.isHidden = false
            validEmail.image = UIImage(named: "check")
        } else {
            validEmail.isHidden = false
            validEmail.image = UIImage(named: "wrong")
        }
    }
    
    func validatePassword(textField: UITextField, range: NSRange, string: String) {
        let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if updatedText.isEmpty {
            validPassword.isHidden = true
        } else if updatedText.validatePassword() {
            validPassword.isHidden = false
            validPassword.image = UIImage(named: "check")
            
        } else {
            validPassword.isHidden = false
            validPassword.image = UIImage(named: "wrong")
        }
    }
}
