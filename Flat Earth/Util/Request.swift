//
//  Request.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/16/22.
//

import Foundation

class Request {
    enum RequestError {
        case badURL
    }
    static let shared = Request()
    
    fileprivate let session = URLSession.shared
    
    
    private init() {
        
    }
    
    func get(path: String, completion: @escaping (Data?, RequestError?) -> Void) {
        guard let url = URL(string: .baseURL + path) else {
            completion(nil, .badURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        session.dataTask(with: request) { data, response, error in
            completion(data, nil)
        }.resume()
    }
    
    func getLaunches(completion: @escaping (Data?, RequestError?) -> Void) {
        get(path: .launchesPath, completion: completion)
    }
}
