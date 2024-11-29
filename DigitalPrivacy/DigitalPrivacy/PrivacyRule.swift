//
//  PrivacyRule.swift
//  DigitalPrivacy
//
//  Created by Kairavi Pandya on 11/27/24.
//

import Foundation

struct PrivacyRule: Identifiable {
    var id: UUID = UUID()
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
    let id = UUID()
    var name: String
    var apps: Set<String> // Changed to Set<String>
    var timePeriod: String
}

