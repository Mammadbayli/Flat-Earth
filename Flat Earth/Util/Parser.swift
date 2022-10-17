//
//  Parser.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/16/22.
//

import Foundation

class Parser {
    enum ParserError: Error {
        case parseError
        case networkError(Request.RequestError)
        case unknownError
    }
    
    static let shared = Parser()

    private init() {
        
    }
    
    func getLaunches(completion: @escaping ([Launch]?, ParserError?) -> Void) {
        Request.shared.getLaunches { data, error in
            guard let data else {
                completion(nil, .networkError(error!))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(.iso8601Full)
            do {
                let launches = try decoder.decode([Launch].self, from: data)
                completion(launches, nil)
            } catch {
                completion(nil, .parseError)
            }
        }
    }
    
}
