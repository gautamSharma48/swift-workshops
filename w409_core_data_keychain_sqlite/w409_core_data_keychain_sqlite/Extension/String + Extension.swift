//
//  String + Extension.swift
//  w409_core_data_keychain_sqlite
//
//  Created by Gautam Sharma on 22/06/23.
//

import Foundation
import CryptoSwift

extension String {
    func aesEncrypt(key: String, iv: String) throws -> String {
        guard let data = self.data(using: .utf8) else {
            print("error while convert string on bytes and store into buffer")
            throw EncryptionError.invalidInputData
        }
        
        let encrypted = try AES(key: Array(key.utf8), blockMode: CBC(iv: Array(iv.utf8)), padding: .pkcs7).encrypt([UInt8](data))
        let encryptedData = Data(encrypted)
        return encryptedData.base64EncodedString()
    }
    
    // AES decryption method
    func aesDecrypt(key: String, iv: String) throws -> String {
        guard let data = Data(base64Encoded: self) else {
            throw EncryptionError.invalidInputData

        }
        
        let decrypted = try AES(key: Array(key.utf8), blockMode: CBC(iv: Array(iv.utf8)), padding: .pkcs7).decrypt([UInt8](data))
        let decryptedData = Data(decrypted)
        
        guard let decryptedString = String(data: decryptedData, encoding: .utf8) else {
            throw EncryptionError.decryptionFailed
        }
        
        return decryptedString
    }
}


enum EncryptionError: Error {
    case invalidInputData
    case decryptionFailed
}
