import SwiftUI

struct InstagramDetailView: View {
    @State private var profileVisibility: String = "Public" // Default visibility

    var body: some View {
        List {
            Section(header: Text("Account")
                        .font(.custom("DMSans-Bold", size: 18))) {
                NavigationLink(destination: ProfileVisibilityView(profileVisibility: $profileVisibility)) {
                    SettingItem(icon: "eye", title: "Profile Visibility (\(profileVisibility))")
                }
                NavigationLink(destination: DummyView(title: "Blocked Accounts", content: "You currently have no blocked accounts.")) {
                    SettingItem(icon: "nosign", title: "Blocked Accounts")
                }
                NavigationLink(destination: DummyView(title: "Data Sharing", content: "Data sharing settings can be configured here.")) {
                    SettingItem(icon: "arrow.triangle.2.circlepath", title: "Data Sharing")
                }
            }

            Section(header: Text("Additional Settings")
                        .font(.custom("DMSans-Bold", size: 18))) {
                NavigationLink(destination: DummyView(title: "Search History", content: "Your recent searches will appear here.")) {
                    SettingItem(icon: "magnifyingglass", title: "Search History")
                }
                NavigationLink(destination: DummyView(title: "Privacy Policy", content: "This is a placeholder for the Privacy Policy details.")) {
                    SettingItem(icon: "lock.shield", title: "Privacy Policy")
                }
                NavigationLink(destination: DummyView(title: "Terms of Service", content: "This is a placeholder for the Terms of Service.")) {
                    SettingItem(icon: "doc.plaintext", title: "Terms of Service")
                }
                NavigationLink(destination: DummyView(title: "Help Center", content: "Welcome to the Help Center. How can we assist you?")) {
                    SettingItem(icon: "questionmark.circle", title: "Help Center")
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Social Media Account Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingItem: View {
    let icon: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .imageScale(.large)
            Text(title)
                .font(.custom("DMSans-Regular", size: 16))
                .foregroundColor(.black)
        }
        .padding(.vertical, 8)
        .background(Color.white)
    }
}

// Dummy View for displaying placeholder content
struct DummyView: View {
    let title: String
    let content: String

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.custom("DMSans-Bold", size: 24))
                .padding(.top)
            Text(content)
                .font(.custom("DMSans-Regular", size: 16))
                .foregroundColor(.gray)
            Spacer()
        }
        .padding()
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
