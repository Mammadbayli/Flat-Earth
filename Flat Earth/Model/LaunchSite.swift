//
//  LaunchSite.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/17/22.
//

import Foundation
struct LaunchSite: Decodable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "site_name"
    }
}
