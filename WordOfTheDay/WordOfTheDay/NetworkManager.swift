//
//  NetworkManager.swift
//  WordOfTheDay
//
//  Created by Alex Wymer on 2018-05-16.
//  Copyright © 2018 Supreme Apps. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    
   
    static func requestGet() {
        
        
        let appId = "e054a255"
        let appKey = "539a60447b7dd113f1d9eba18a132b93"
        
        let language = "en"
        let word = "Cat"
        let word_id = word.lowercased()
        
        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/entries/\(language)/\(word_id)")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        
        let session = URLSession.shared
        _ = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response,
                let data = data,
                let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                print(response)
                print(jsonData)
            } else {
                print(error!)
                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue)!)
            }
        }).resume()

    }
    
    
}
