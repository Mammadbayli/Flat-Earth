//
//  Links.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/17/22.
//

import Foundation
struct Links: Decodable {
    var missionPatch: URL?
    
    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
    }
}
