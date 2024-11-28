//
//  PrivacyProfile.swift
//  DigitalPrivacy
//
//  Created by Kairavi Pandya on 11/27/24.
//

import Foundation

// Model for Privacy Profiles
struct PrivacyProfile: Identifiable {
    let id = UUID()
    var name: String
    var profiles: Set<String>
    var rules: Set<String>
    var startTime: String
    var endTime: String
}
