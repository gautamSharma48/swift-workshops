//
//  RegisterViewController.swift
//  w409_core_data_keychain_sqlite
//
//  Created by Gautam Sharma on 22/06/23.
//

import UIKit



class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Registration"
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        registerHandler()
    }
    
    
    @IBAction func coreDataButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func userDefaultButton(_ sender: Any) {
        let (name,email) = DatabaseManager.retriveUser();
        nameField.text = name;
        emailField.text = email;
    }
    
    
    @IBAction func keyChainButton(_ sender: Any) {
        keyChainHandler()
    }
    
    func registerHandler(){
        guard let name = nameField.text , let email = emailField.text,
              let password = passwordField.text else{
            openAlert(title: "Alert", message: "Please add all details")
            return
        }
        
        if name.isEmpty || email.isEmpty || password.isEmpty {
            openAlert(title: "Alert", message: "Please add all details")
            return
        }
        
        let userDetail = RegisterModel(name: name, email: email, password: password)
        //save data on sqlite using core data
        DatabaseManager.addUser(userDetail)
        //save data on user defaults
        DatabaseManager.setUser(userDetail)
        //save password on key chain
         let encPassword = try!  password.aesEncrypt(key: Constants.key , iv: Constants.initializationVector)
        print(encPassword)
        guard let data = encPassword.data(using: .utf8) else {
            return
        }
        let status: Bool = DatabaseManager.setKeyChain(data, forKey:"loginCred")
        if status {
            openAlert(title: "Registeration", message: "Data saved ")
        }
        else{
            openAlert(title: "Registeration", message: "key chain not saved ")
        }
        
        
    }
    
    func keyChainHandler() {
        guard let data = DatabaseManager.retriveKeyChain(forKey: "loginCred") else {
            return
        }
        guard let cred = String(data: data, encoding: .utf8) else {
            print("password is not fetched from keychain")
            return
        }
        openAlert(title: "Keychain Password", message:cred)
    }
    
    
}

extension UIViewController {
    func openAlert(title:String , message:String){
        let alertContoller = UIAlertController(
            title: title, message: message, preferredStyle: .alert
        )
        
        let okay = UIAlertAction(title: "Okay!", style: .default)
        alertContoller.addAction(okay);
        present(alertContoller,animated: true)
    }
}
