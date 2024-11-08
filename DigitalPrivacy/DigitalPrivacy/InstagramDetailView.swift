struct InstagramDetailView: View {
    var body: some View {
        List {
            Section(header: Text("Instagram Account")
                        .font(.custom("DMSans-Bold", size: 18))) {
                NavigationLink(destination: ProfileVisibilityView()) {
                    SettingItem(icon: "eye", title: "Profile Visibility")
                }
                NavigationLink(destination: ActivityStatusView()) {
                    SettingItem(icon: "figure.walk", title: "Activity Status")
                }
                SettingItem(icon: "location", title: "Location Services")
                SettingItem(icon: "nosign", title: "Blocked Accounts")
                SettingItem(icon: "arrow.triangle.2.circlepath", title: "Data Sharing")
            }

            Section(header: Text("Additional Settings")
                        .font(.custom("DMSans-Bold", size: 18))) {
                NavigationLink(destination: TermsOfServiceView()) {
                    SettingItem(icon: "doc.plaintext", title: "Terms of Service")
                }
                NavigationLink(destination: HelpCenterView()) {
                    SettingItem(icon: "questionmark.circle", title: "Help Center")
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Instagram Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}
