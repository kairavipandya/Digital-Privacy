struct FacebookDetailView: View {
    var body: some View {
        List {
            Section(header: Text("Facebook Account")
                        .font(.custom("DMSans-Bold", size: 18))) {
                NavigationLink(destination: ProfileVisibilityView()) {
                    SettingItem(icon: "eye", title: "Profile Visibility")
                }
                NavigationLink(destination: FriendsListView()) {
                    SettingItem(icon: "person.2", title: "Friends List")
                }
                NavigationLink(destination: BlockedUsersView()) {
                    SettingItem(icon: "nosign", title: "Blocked Users")
                }
                SettingItem(icon: "globe", title: "Public Posts")
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
        .navigationTitle("Facebook Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}
