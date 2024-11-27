//
//  PrivacyRule.swift
//  DigitalPrivacy
//
//  Created by Kairavi Pandya on 11/27/24.
//

import Foundation

struct PrivacyRule: Identifiable {
    var id: UUID = UUID() // Generates a unique identifier for each rule
    var ruleType: String
    var selectedApps: [String]
    var startTime: String
    var endTime: String

    init(ruleType: String, selectedApps: [String], startTime: String, endTime: String) {
        self.ruleType = ruleType
        self.selectedApps = selectedApps
        self.startTime = startTime
        self.endTime = endTime
    }
}

struct Rule: Identifiable {
    let id = UUID() // Ensures each rule has a unique identifier
    var name: String
    var apps: [String]
    var timePeriod: String
}
