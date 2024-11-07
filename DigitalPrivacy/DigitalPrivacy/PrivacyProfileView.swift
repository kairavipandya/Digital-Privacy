import SwiftUI

// Data model for storing profile information
struct PrivacyProfile: Identifiable {
    let id = UUID()
    let name: String
    let profiles: Set<String>
    let rules: Set<String>
    let startTime: String
    let endTime: String
}

struct PrivacyProfilesView: View {
    @State private var profiles: [PrivacyProfile] = []

    var body: some View {
        NavigationView {
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
                    ForEach(profiles) { profile in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(profile.name)
                                    .font(.custom("DMSans-Bold", size: 18))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            Text("Profiles: \(profile.profiles.joined(separator: ", "))")
                                .font(.custom("DMSans-Regular", size: 16))
                                .foregroundColor(.gray)
                            Text("Rules: \(profile.rules.joined(separator: ", "))")
                                .font(.custom("DMSans-Regular", size: 16))
                                .foregroundColor(.gray)
                            Text("Activation Time: \(profile.startTime) - \(profile.endTime)")
                                .font(.custom("DMSans-Regular", size: 16))
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 8)
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.white)
            }
            .navigationTitle("Privacy Profiles")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

struct PrivacyProfilesView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyProfilesView()
    }
}
