//
//  DatabaseManager.swift
//  w409_core_data_keychain_sqlite
//
//  Created by Gautam Sharma on 22/06/23.
//

import Foundation
import CoreData
import UIKit
import Security
import CommonCrypto


class DatabaseManager {
    
    private static var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to retrieve the AppDelegate")
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    static func addUser(_ user : RegisterModel)  {
        let registerEntity = RegisterEntity(context: context)
        registerEntity.name = user.name;
        registerEntity.email = user.email
        do{
            
            try  context.save()
        }
        catch{
            print("error \(error)")
        }
        
    }
    
    static func getUsers() -> [RegisterEntity] {
        var users :[RegisterEntity] = []
        do{
            users = try context.fetch(RegisterEntity.fetchRequest())
        }
        catch{
            print("error: \(error)")
        }
        return users
        
    }
    
    static func setUser(_ user : RegisterModel){
        let userDefault = UserDefaults.standard
        userDefault.set(user.name, forKey: "name")
        userDefault.set(user.email,forKey: "email")
        userDefault.synchronize() // immediately save the changes
    }
    
    static func retriveUser() -> (name: String? , email: String?){
        let userDefault = UserDefaults.standard
        let name = userDefault.string(forKey: "name")
        let email = userDefault.string(forKey: "email")
        return (name,email)
    }
    
    static func setKeyChain(_ data: Data , forKey key : String) -> Bool {
        let query : [String: Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecValueData as String : data
        ]
        print(query)
        //delete any existinf data for given key
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    static func retriveKeyChain(forKey key : String) -> Data?{
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue!
        ]
        
        var retrivedData: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &retrivedData);
        guard status == errSecSuccess , let data = retrivedData as? Data  else {
            return nil
        }
        return data
    }
    
}
