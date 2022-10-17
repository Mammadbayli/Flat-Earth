//
//  Launch.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/16/22.
//

//- Mission Name
//- Rocket Name
//- Launch Site Name
//- Date of Launch
//- Launch patch image, or default image when not provided by the API

import Foundation

struct Launch: Decodable {
    var missionName: String
    var date: Date
    var rocket: Rocket
    var launchSite: LaunchSite
    var links: Links
    
    enum CodingKeys: String, CodingKey {
        case missionName = "mission_name"
        case date = "launch_date_utc"
        case rocket, links
        case launchSite = "launch_site"
    }
}
