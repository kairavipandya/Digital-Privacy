import SwiftUI

// Define the social media accounts using custom images
struct SocialMediaAccount {
    var name: String
    var imageName: String // This will reference the image in Assets
}

// Sample data for social media accounts
let accounts = [
    SocialMediaAccount(name: "Instagram", imageName: "instagram"),
    SocialMediaAccount(name: "Facebook", imageName: "facebook"),
    SocialMediaAccount(name: "Snapchat", imageName: "snapchat"),
    SocialMediaAccount(name: "Twitter", imageName: "twitter")
]

struct DashboardView: View {
    var body: some View {
        TabView {
            NavigationView {
                List {
                    // Social media accounts section with custom logos and increased spacing
                    Section(header: Text("My Accounts").font(.custom("DMSans-Bold", size: 22))) {
                        ForEach(accounts, id: \.name) { account in
                            HStack {
                                Image(account.imageName) // Use the custom image from Assets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50) // Increased size of the logos
                                    .clipShape(Circle()) // Clip image to a circle
                                Text(account.name)
                                    .font(.custom("DMSans-Regular", size: 18))
                                Spacer()
                                Image(systemName: "chevron.right")  // Arrow indicator
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, 12) // Increased vertical padding for more spacing
                            .background(Color.white)  // Ensure row background is white
                        }
                    }
                    .textCase(nil)  // Preserve original text case for headers

                    // Custom Privacy Rules section with arrow
                    Section {
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
                            Image(systemName: "chevron.right")  // Arrow indicating more details
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 8) // Ensure spacing between header and subheader
                        .background(Color.white) // Background color for the entire block
                    }
                    .textCase(nil)  // Preserve original text case for headers
                    .listRowSeparator(.visible)  // Ensure separator is visible between sections

                    // Manage Privacy Profiles section with arrow
                    Section {
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
                            Image(systemName: "chevron.right")  // Arrow indicating more details
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 8) // Ensure spacing between header and subheader
                        .background(Color.white) // Background color for the entire block
                    }
                    .textCase(nil)  // Preserve original text case for headers
                    .listRowSeparator(.visible)  // Ensure separator is visible between sections
                }
                .listStyle(PlainListStyle())  // Use PlainListStyle for no separators between sections
                .navigationBarTitle("SafeSphere", displayMode: .large)
                .background(Color.white.edgesIgnoringSafeArea(.all))  // White background behind the list
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            NavigationView {
                Text("Settings View")
                    .navigationBarTitle("Settings", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }

            NavigationView {
                Text("Profile View")
                    .navigationBarTitle("Profile", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
        }
        .accentColor(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))  // Set the selected tab item color to deep purple
        .background(Color.white.edgesIgnoringSafeArea(.all))  // Set the background color of TabView to white
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
