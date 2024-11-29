import SwiftUI

struct PrivacyProfilesView: View {
    @State private var profiles: [PrivacyProfile] = []
    @State private var recentlyAddedProfile: String? = nil

    var body: some View {
        VStack {
            headerView

            List {
                ForEach(profiles) { profile in
                    profileRow(for: profile)
                }
            }
            .listStyle(PlainListStyle())
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Components
    private var headerView: some View {
        HStack {
            Text("Manage Privacy Profiles")
                .font(.custom("DMSans-Bold", size: 24))
            Spacer()
            NavigationLink(destination: CreatePrivacyProfileView(profiles: $profiles)) {
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }

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
}
