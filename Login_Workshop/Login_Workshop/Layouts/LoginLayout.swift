//
//  LoginLayout.swift
//  Login_Workshop
//
//  Created by Gautam Sharma on 16/06/23.
//

import Foundation
import UIKit


class LoginController : UIViewController {
    
    
    static func commonLayout(viewName:UIView , stackName:UIStackView){
        viewName.layer.cornerRadius=7.0;
        viewName.layer.borderWidth = 1.0
        viewName.layer.borderColor = UIColor.black.cgColor;
        viewName.layer.backgroundColor = UIColor.white.cgColor;
        // Align the emailStackView horizontally to the center
        stackName.centerYAnchor.constraint(equalTo: viewName.centerYAnchor).isActive = true;
    }
    
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
        viewController.openAlert(title: "Login", message: "Login Successful", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
            print("Okay clicked!")
        }])
    }
    
}
