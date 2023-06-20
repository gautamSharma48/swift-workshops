//
//  Api.swift
//  photo_app_w407
//
//  Created by Gautam Sharma on 20/06/23.
//

import Foundation
import Alamofire


class Api {
    
    weak var vc : ViewController?
    
    
    func fetchDataAF(){
        AF.request("https://jsonplaceholder.typicode.com/photos").response{
            response in
            
            if let data = response.data {
                do {
                    // Parse the JSON data
                    let decoder = JSONDecoder()
                    self.vc?.photos = try decoder.decode([Photo].self, from: data)
                    
                    // Reload the collection view on the main queue
                    DispatchQueue.main.async {
                        self.vc?.collectionView.reloadData()
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
            
            
            
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            if let data = data {
                do {
                    // Parse the JSON data
                    let decoder = JSONDecoder()
                    self.vc?.photos = try decoder.decode([Photo].self, from: data)
                    
                    // Reload the collection view on the main queue
                    DispatchQueue.main.async {
                        self.vc?.collectionView.reloadData()
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        
        task.resume()
    }
    
}
