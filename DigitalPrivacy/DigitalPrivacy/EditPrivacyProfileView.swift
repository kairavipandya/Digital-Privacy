//
//  EditPrivacyProfileView.swift
//  DigitalPrivacy
//
//  Created by Kairavi Pandya on 11/27/24.
//
import SwiftUI
import Foundation

struct EditPrivacyProfileView: View {
    @Binding var profile: PrivacyProfile
    @Binding var profiles: [PrivacyProfile]
    
    @Environment(\.presentationMode) var presentationMode // For dismissing the view

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Edit Privacy Profile")
                .font(.custom("DMSans-Bold", size: 24))
                .padding(.top)

            // Profile Name
            VStack(alignment: .leading) {
                Text("Profile Name")
                    .font(.custom("DMSans-Bold", size: 16))
                TextField("Profile Name", text: $profile.name)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5))
                    )
            }

            // Apps Selection
            VStack(alignment: .leading) {
                Text("Select Profiles")
                    .font(.custom("DMSans-Bold", size: 16))
                MultiSelectDropdown(
                    options: ["Instagram", "Facebook", "Snapchat", "Twitter"],
                    selectedOptions: $profile.profiles
                )
            }

            // Rules Selection
            VStack(alignment: .leading) {
                Text("Add Rules")
                    .font(.custom("DMSans-Bold", size: 16))
                MultiSelectDropdown(
                    options: ["Online Status", "Restrict Messaging", "Post Notifications", "Facial Recognition"],
                    selectedOptions: $profile.rules
                )
            }

            // Time Period
            VStack(alignment: .leading) {
                Text("Activation Time")
                    .font(.custom("DMSans-Bold", size: 16))
                HStack {
                    TextField("Start Time", text: $profile.startTime)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("End Time", text: $profile.endTime)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }

            Spacer()

            // Save Changes Button
            Button(action: {
                if let index = profiles.firstIndex(where: { $0.id == profile.id }) {
                    profiles[index] = profile
                }
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("SAVE CHANGES")
                    .font(.custom("DMSans-Bold", size: 16))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationBarTitle("Edit Privacy Profile", displayMode: .inline)
    }
}

// Preview
struct EditPrivacyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditPrivacyProfileView(
            profile: .constant(PrivacyProfile(name: "Personal", profiles: ["Instagram"], rules: ["Online Status"], startTime: "8:00 AM", endTime: "5:00 PM")),
            profiles: .constant([])
        )
    }
}
