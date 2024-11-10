import SwiftUI

// Define the social media accounts using custom images
struct SocialMediaAccount {
    var name: String
    var imageName: String // This will reference the image in Assets
}

// Sample accounts
let accounts = [
    SocialMediaAccount(name: "Instagram", imageName: "instagram"),
    SocialMediaAccount(name: "Facebook", imageName: "facebook"),
    SocialMediaAccount(name: "Snapchat", imageName: "snapchat"),
    SocialMediaAccount(name: "Twitter", imageName: "twitter")
]

struct DashboardView: View {
    var body: some View {
        TabView {
            // Home Tab
            NavigationView {
                List {
                    // My Accounts Section
                    Section(header: Text("My Accounts").font(.custom("DMSans-Bold", size: 22))) {
                        ForEach(accounts, id: \.name) { account in
                            NavigationLink(destination: InstagramDetailView()) {
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
                    
                    // Custom Privacy Rules Section
                    Section {
                        NavigationLink(destination: CustomPrivacyRulesView()) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Custom Privacy Rules")
                                        .font(.custom("DMSans-Bold", size: 18))
                                        .foregroundColor(.black)
                                    Text("Apply to Multiple Accounts")
                                        .font(.custom("DMSans-Regular", size: 16))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                        }
                        .padding(.vertical, 8)
                        .background(Color.white)
                    }
                    
                    // Manage Privacy Profiles Section
                    Section {
                        NavigationLink(destination: PrivacyProfilesView()) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Manage Privacy Profiles")
                                        .font(.custom("DMSans-Bold", size: 18))
                                        .foregroundColor(.black)
                                    Text("School vs Personal")
                                        .font(.custom("DMSans-Regular", size: 16))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(.vertical, 8)
                            .background(Color.white)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .accentColor(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)) // Set the accent color
                .navigationBarTitle("SafeSphere", displayMode: .large)
                .background(Color.white.edgesIgnoringSafeArea(.all))
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            // Settings Tab
            NavigationView {
                SettingsView() // Link to the SettingsView
                    .navigationBarTitle("Settings", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            
            // Profile Tab
            NavigationView {
                ProfileView() // Link to the ProfileView
                    .navigationBarTitle("Profile", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
        }
        .accentColor(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)) // Set the global TabView accent color
    }
}

// Move the PreviewProvider struct outside of the main DashboardView struct
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .previewDevice("iPhone 16")
    }
}
