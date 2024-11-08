struct TwitterDetailView: View {
    var body: some View {
        List {
            Section(header: Text("Twitter Account")
                        .font(.custom("DMSans-Bold", size: 18))) {
                NavigationLink(destination: ProfilePrivacyView()) {
                    SettingItem(icon: "person", title: "Profile Privacy")
                }
                NavigationLink(destination: NotificationSettingsView()) {
                    SettingItem(icon: "bell", title: "Notification Settings")
                }
                NavigationLink(destination: DirectMessagesView()) {
                    SettingItem(icon: "envelope", title: "Direct Messages")
                }
            }

            Section(header: Text("Additional Settings")
                        .font(.custom("DMSans-Bold", size: 18))) {
                NavigationLink(destination: PrivacyPolicyView()) {
                    SettingItem(icon: "lock", title: "Privacy Policy")
                }
                NavigationLink(destination: TermsOfServiceView()) {
                    SettingItem(icon: "doc.text", title: "Terms of Service")
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Twitter Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}
