import SwiftUI
import Foundation

struct PrivacyProfilesView: View {
    @State private var profiles: [PrivacyProfile] = []
    @State private var recentlyAddedProfile: String? = nil

    var body: some View {
        VStack {
            headerView()

            List {
                ForEach(profiles) { profile in
                    profileRow(for: profile)
                }
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }

    // Extracted Header View
    @ViewBuilder
    private func headerView() -> some View {
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
    }

    @ViewBuilder
    private func profileRow(for profile: PrivacyProfile) -> some View {
        if let index = profiles.firstIndex(where: { $0.id == profile.id }) {
            NavigationLink(destination: EditPrivacyProfileView(profile: $profiles[index], profiles: $profiles)) {
                VStack(alignment: .leading) {
                    HStack {
                        Text(profile.name)
                            .font(.custom("DMSans-Bold", size: 18))
                            .foregroundColor(recentlyAddedProfile == profile.name ? .purple : .black)
                        Spacer()
                    }
                    Text("Apps: \(profile.profiles.joined(separator: ", "))")
                        .foregroundColor(.gray)
                        .font(.custom("DMSans-Regular", size: 14))
                }
            }
        }
    }
}
