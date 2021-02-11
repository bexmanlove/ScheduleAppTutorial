//
//  Schedule.swift
//  FirstApp
//
//  Created by Sarah on 2/9/21.
//

import Foundation

struct Schedule : Codable {
    let startTime: String?
    let endTime: String?
    let type: String?
    let name: String?
    let host: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case startTime = "start_time"
        case endTime = "end_time"
        case type = "event_type"
        case name = "event_name"
        case host = "Host"
        case description = "event_description"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        startTime = try values.decodeIfPresent(String.self, forKey: .startTime)
        endTime = try values.decodeIfPresent(String.self, forKey: .endTime)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        host = try values.decodeIfPresent(String.self, forKey: .host)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }
}
