struct SnapchatDetailView: View {
    var body: some View {
        List {
            Section(header: Text("Snapchat Account")
                        .font(.custom("DMSans-Bold", size: 18))) {
                NavigationLink(destination: LocationSharingView()) {
                    SettingItem(icon: "location", title: "Location Sharing")
                }
                NavigationLink(destination: MessagePrivacyView()) {
                    SettingItem(icon: "message", title: "Message Privacy")
                }
                SettingItem(icon: "camera", title: "Camera Permissions")
            }

            Section(header: Text("Additional Settings")
                        .font(.custom("DMSans-Bold", size: 18))) {
                NavigationLink(destination: TermsOfServiceView()) {
                    SettingItem(icon: "doc.text", title: "Terms of Service")
                }
                NavigationLink(destination: HelpCenterView()) {
                    SettingItem(icon: "questionmark.circle", title: "Help Center")
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Snapchat Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}
