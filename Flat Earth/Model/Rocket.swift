//
//  Rocket.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/17/22.
//

import Foundation

struct Rocket: Decodable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "rocket_name"
    }
}
