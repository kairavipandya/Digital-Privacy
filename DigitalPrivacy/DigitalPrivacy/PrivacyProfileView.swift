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
            List {
                // Existing predefined personal profile section
                Section(header: Text("Personal Profile")
                            .font(.custom("DMSans-Bold", size: 18))) {
                    VStack(alignment: .leading) {
                        Text("Configure privacy settings for personal time")
                            .font(.custom("DMSans-Regular", size: 16))
                            .foregroundColor(.gray)
                        
                        Toggle("Online Status", isOn: .constant(false))
                            .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        
                        Toggle("Restrict Messaging", isOn: .constant(false))
                            .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        
                        Toggle("Post Notifications", isOn: .constant(false))
                            .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                    }
                }
                .padding(.vertical)

                // ForEach for displaying created profiles
                ForEach(profiles) { profile in
                    NavigationLink(destination: ProfileDetailView(profile: profile)) {
                        HStack {
                            Text(profile.name)
                                .font(.custom("DMSans-Bold", size: 18))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Manage Privacy Profiles")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white)
    }
}
