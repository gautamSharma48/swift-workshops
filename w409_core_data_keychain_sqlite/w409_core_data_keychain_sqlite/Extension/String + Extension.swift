//
//  String + Extension.swift
//  w409_core_data_keychain_sqlite
//
//  Created by Gautam Sharma on 22/06/23.
//

import Foundation
import CryptoSwift

extension String {
    func aesEncrypt(key: String , iv: String) throws -> String{
        let data = self.data(using: .utf8)!;
         let encrypted = try! AES(key:Array(key.utf8), blockMode: CBC.init(iv: Array(iv.utf8)), padding:  .pkcs7).encrypt([UInt8](data))
        let encryptedData = Data(encrypted);
        return encryptedData.base64EncodedString()
    }
    func aesDecrypt(key:String , iv:String) throws -> String {
        let data = Data(base64Encoded: self)!;
        let decrypted = try! AES(key: Array(key.utf8), blockMode: CBC.init(iv: Array(iv.utf8)),padding: .pkcs7).decrypt([UInt8](data));
        let decryptedData = Data(decrypted);
        return decryptedData.base64EncodedString()
    }
}
