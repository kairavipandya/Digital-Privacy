import SwiftUI

struct PrivacyProfilesView: View {
    @State private var profiles: [PrivacyProfile] = [
        PrivacyProfile(
            name: "Example Profile",
            profiles: ["Instagram", "Facebook"],
            rules: ["Online Status", "Restrict Messaging"],
            startTime: "8:00 AM",
            endTime: "5:00 PM"
        )
    ] // Added a default profile
    @State private var recentlyAddedProfile: String? = nil
    @State private var isEditing: Bool = false // Toggle for edit mode
    @State private var showDeleteConfirmation: Bool = false // Show confirmation dialog
    @State private var profileToDelete: PrivacyProfile? // Track the profile to delete

    var body: some View {
        VStack {
            headerView // Includes both Edit and Create buttons

            List {
                createProfileButton // New button to create a privacy profile

                ForEach(profiles) { profile in
                    profileRow(for: profile)
                        .overlay(
                            isEditing ? deleteButton(for: profile) : nil,
                            alignment: .trailing
                        )
                }
            }
            .listStyle(PlainListStyle())
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitleDisplayMode(.inline)
        .confirmationDialog(
            "Are you sure you want to delete this profile?",
            isPresented: $showDeleteConfirmation,
            titleVisibility: .visible
        ) {
            Button("Delete", role: .destructive) {
                if let profile = profileToDelete {
                    deleteProfile(profile)
                }
            }
            Button("Cancel", role: .cancel) {}
        }
    }

    // MARK: - Header View
    private var headerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Manage Privacy Profiles")
                    .font(.custom("DMSans-Bold", size: 24))
                Spacer()
                // Edit Button
                Button(action: { isEditing.toggle() }) {
                    Text(isEditing ? "Done" : "Edit")
                        .font(.custom("DMSans-Bold", size: 16))
                        .foregroundColor(.blue)
                }
            }
            // Description
            Text("Privacy Profile: Tailored restrictions for your daily needs.")
                .font(.custom("DMSans-Regular", size: 16))
                .foregroundColor(.gray)
                .padding(.top, 4)
        }
        .padding()
    }

    // MARK: - Create Profile Button
    @ViewBuilder
    private var createProfileButton: some View {
        HStack {
            Text("Create a New Privacy Profile")
                .font(.custom("DMSans-Bold", size: 18))
            Spacer()
            NavigationLink(
                destination: CreatePrivacyProfileView(profiles: $profiles)
            ) {
                Text("+")
                    .font(.custom("DMSans-Bold", size: 24))
                    .foregroundColor(.blue)
                    .padding(.trailing, 10)
            }
        }
        .padding()
    }

    // MARK: - Profile Row
    @ViewBuilder
    private func profileRow(for profile: PrivacyProfile) -> some View {
        if let index = profiles.firstIndex(where: { $0.id == profile.id }) {
            NavigationLink(destination: EditPrivacyProfileView(profile: $profiles[index], profiles: $profiles)) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(profile.name)
                        .font(.custom("DMSans-Bold", size: 18))
                        .foregroundColor(recentlyAddedProfile == profile.name ? .purple : .black)
                    Text("Apps: \(profile.profiles.joined(separator: ", "))")
                        .font(.custom("DMSans-Regular", size: 14))
                        .foregroundColor(.gray)
                    Text("Rules: \(profile.rules.joined(separator: ", "))")
                        .font(.custom("DMSans-Regular", size: 14))
                        .foregroundColor(.gray)
                    Text("Activation Time: \(profile.startTime) - \(profile.endTime)")
                        .font(.custom("DMSans-Regular", size: 14))
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)
            }
        }
    }

    // MARK: - Delete Button
    @ViewBuilder
    private func deleteButton(for profile: PrivacyProfile) -> some View {
        Button(action: {
            profileToDelete = profile
            showDeleteConfirmation = true
        }) {
            Image(systemName: "trash")
                .foregroundColor(.red)
                .padding(.trailing, 10)
        }
    }

    // MARK: - Delete Profile Action
    private func deleteProfile(_ profile: PrivacyProfile) {
        if let index = profiles.firstIndex(where: { $0.id == profile.id }) {
            profiles.remove(at: index) // Remove the profile from the list
        }
    }
}
