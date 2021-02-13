//
//  Schedule.swift
//  FirstApp
//
//  Created by Sarah on 2/9/21.
//

import Foundation

// Creating this struct because of how the data is formatted in the JSON file
struct Schedule : Codable {
    let startTime: String?
    let endTime: String?
    let eventType: String?
    let eventName: String?
    let host: String?
    let eventDescription: String?
}
