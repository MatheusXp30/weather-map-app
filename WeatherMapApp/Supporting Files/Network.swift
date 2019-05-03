//
//  Network.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 02/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class Network {
    
    func downloadImageFrom(url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            DispatchQueue.main.async() {
                completion(UIImage(data: data), nil)
            }
        }
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
