import SwiftUI

struct InstagramDetailView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Instagram Account")
                            .font(.custom("DMSans-Bold", size: 18))) {

                    NavigationLink(destination: ProfileVisibilityView()) {
                        SettingItem(icon: "eye", title: "Profile Visibility")
                    }

                    SettingItem(icon: "figure.walk", title: "Activity Status")
                    SettingItem(icon: "location", title: "Location Services")
                    SettingItem(icon: "nosign", title: "Blocked Accounts")
                    SettingItem(icon: "arrow.triangle.2.circlepath", title: "Data Sharing")
                }

                Section(header: Text("Additional Settings")
                            .font(.custom("DMSans-Bold", size: 18))) {
                    SettingItem(icon: "magnifyingglass", title: "Search History")
                    SettingItem(icon: "link", title: "Connected Apps")
                    SettingItem(icon: "lock.shield", title: "Privacy Policy")
                    SettingItem(icon: "doc.plaintext", title: "Terms of Service")
                    SettingItem(icon: "questionmark.circle", title: "Help Center")
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Instagram Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

// SettingItem component (included within the same file for simplicity)
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