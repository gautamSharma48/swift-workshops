//
//  CommonUtils.swift
//  Login_Workshop
//
//  Created by Gautam Sharma on 19/06/23.
//

import Foundation
import UIKit


class CommonUtils {
    
    static func commonLayout(viewName:UIView){
        viewName.layer.cornerRadius=7.0;
        viewName.layer.borderWidth = 1.0
        viewName.layer.borderColor = UIColor.black.cgColor;
        viewName.layer.backgroundColor = UIColor.white.cgColor;
    }
}
