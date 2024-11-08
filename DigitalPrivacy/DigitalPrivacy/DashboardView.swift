struct DashboardView: View {
    var body: some View {
        TabView {
            // Home Tab
            NavigationView {
                List {
                    Section(header: Text("My Accounts").font(.custom("DMSans-Bold", size: 22))) {
                        ForEach(accounts, id: \.name) { account in
                            NavigationLink(destination: getDetailView(for: account.name)) {
                                HStack {
                                    Image(account.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                    Text(account.name)
                                        .font(.custom("DMSans-Regular", size: 18))
                                    Spacer()
                                }
                                .padding(.vertical, 12)
                                .background(Color.white)
                            }
                        }
                    }
                    .textCase(nil)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Dashboard")
                .background(Color.white.edgesIgnoringSafeArea(.all))
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            // Settings Tab
            NavigationView {
                SettingsView()
                    .navigationBarTitle("Settings", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }

            // Profile Tab
            NavigationView {
                ProfileView()
                    .navigationBarTitle("Profile", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
        }
        .accentColor(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

// Helper function to navigate to corresponding detail views
@ViewBuilder
func getDetailView(for accountName: String) -> some View {
    switch accountName {
    case "Instagram":
        InstagramDetailView()
    case "Facebook":
        FacebookDetailView()
    case "Snapchat":
        SnapchatDetailView()
    case "Twitter":
        TwitterDetailView()
    default:
        Text("Detail view not available.")
    }
}
