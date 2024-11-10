import Foundation

struct PrivacyProfile: Identifiable {
    let id = UUID()
    let name: String
    let profiles: Set<String>
    let rules: Set<String>
    let startTime: String
    let endTime: String
}

import SwiftUI

struct PrivacyProfilesView: View {
    @State private var profiles: [PrivacyProfile] = []

    var body: some View {
        VStack {
            HStack {
                Text("Manage Privacy Profiles")
                    .font(.custom("DMSans-Bold", size: 24))
                    .padding(.top, 16)
                Spacer()
                NavigationLink(destination: CreatePrivacyProfileView(profiles: $profiles)) {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                }
                .padding(.top, 16)
            }
            .padding(.horizontal)

            List {
                // Display a predefined "Personal Profile" section
                Section {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Personal Profile")
                                .font(.custom("DMSans-Bold", size: 18))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        Text("Configure privacy settings for personal time")
                            .font(.custom("DMSans-Regular", size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                    
                    Toggle("Online Status", isOn: .constant(false))
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        .padding(.vertical, 8)
                    
                    Toggle("Restrict Messaging", isOn: .constant(false))
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        .padding(.vertical, 8)
                    
                    Toggle("Post Notifications", isOn: .constant(false))
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        .padding(.vertical, 8)
                    
                    HStack {
                        Text("Activation Time")
                            .font(.custom("DMSans-Regular", size: 16))
                            .foregroundColor(.black)
                        Spacer()
                        Text("3:00 PM - 8:00 AM")
                            .font(.custom("DMSans-Regular", size: 16))
                            .foregroundColor(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
                    }
                    .padding(.vertical, 8)
                }

                // Display each created profile in a structured format
                ForEach(profiles) { profile in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(profile.name)
                                .font(.custom("DMSans-Bold", size: 18))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        
                        Text("Profiles:")
                            .font(.custom("DMSans-Regular", size: 16))
                            .foregroundColor(.gray)
                        Text(profile.profiles.joined(separator: ", "))
                            .font(.custom("DMSans-Regular", size: 16))
                            .padding(.leading, 16)
                        
                        Text("Rules:")
                            .font(.custom("DMSans-Regular", size: 16))
                            .foregroundColor(.gray)
                        Text(profile.rules.joined(separator: ", "))
                            .font(.custom("DMSans-Regular", size: 16))
                            .padding(.leading, 16)
                        
                        HStack {
                            Text("Activation Time:")
                                .font(.custom("DMSans-Regular", size: 16))
                                .foregroundColor(.gray)
                            Spacer()
                            Text("\(profile.startTime) - \(profile.endTime)")
                                .font(.custom("DMSans-Regular", size: 16))
                                .foregroundColor(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(PlainListStyle())
            .background(Color.white)
        }
        .padding(.horizontal)
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}
