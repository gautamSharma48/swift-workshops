//
//  UIViewController + Extension.swift
//  Login_Workshop
//
//  Created by Gautam Sharma on 23/06/23.
//

import UIKit



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
