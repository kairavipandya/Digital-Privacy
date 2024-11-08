import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/arjunprabhune/Desktop/Classes/HCI/Digital-Privacy/DigitalPrivacy/DigitalPrivacy/DashboardView.swift", line: 1)
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
                    Section(header: Text(__designTimeString("#1338_0", fallback: "My Accounts")).font(.custom(__designTimeString("#1338_1", fallback: "DMSans-Bold"), size: __designTimeInteger("#1338_2", fallback: 22)))) {
                        
                        // Add a NavigationLink for Instagram
                        NavigationLink(destination: InstagramDetailView()) {
                            HStack {
                                Image(__designTimeString("#1338_3", fallback: "instagram")) // Use the custom image from Assets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: __designTimeInteger("#1338_4", fallback: 50), height: __designTimeInteger("#1338_5", fallback: 50)) // Increased size of the logos
                                    .clipShape(Circle()) // Clip image to a circle
                                Text(__designTimeString("#1338_6", fallback: "Instagram"))
                                    .font(.custom(__designTimeString("#1338_7", fallback: "DMSans-Regular"), size: __designTimeInteger("#1338_8", fallback: 18)))
                                Spacer()
                                // Removed the extra arrow here
                            }
                            .padding(.vertical, __designTimeInteger("#1338_9", fallback: 12)) // Increased vertical padding for more spacing
                            .background(Color.white)  // Ensure row background is white
                        }

                        // For the rest of the accounts (Facebook, Snapchat, Twitter)
                        ForEach(accounts.filter { $0.name != __designTimeString("#1338_10", fallback: "Instagram") }, id: \.name) { account in
                            HStack {
                                Image(account.imageName) // Use the custom image from Assets
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: __designTimeInteger("#1338_11", fallback: 50), height: __designTimeInteger("#1338_12", fallback: 50)) // Increased size of the logos
                                    .clipShape(Circle()) // Clip image to a circle
                                Text(account.name)
                                    .font(.custom(__designTimeString("#1338_13", fallback: "DMSans-Regular"), size: __designTimeInteger("#1338_14", fallback: 18)))
                                Spacer()
                                Image(systemName: __designTimeString("#1338_15", fallback: "chevron.right"))  // Arrow indicator
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, __designTimeInteger("#1338_16", fallback: 12)) // Increased vertical padding for more spacing
                            .background(Color.white)  // Ensure row background is white
                        }
                    }
                    .textCase(nil)  // Preserve original text case for headers

                    // Custom Privacy Rules section with arrow
                    Section {
                        NavigationLink(destination: CustomPrivacyRulesView()) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(__designTimeString("#1338_17", fallback: "Custom Privacy Rules"))
                                        .font(.custom(__designTimeString("#1338_18", fallback: "DMSans-Bold"), size: __designTimeInteger("#1338_19", fallback: 18)))
                                        .foregroundColor(.black)
                                    Text(__designTimeString("#1338_20", fallback: "Apply to Multiple Accounts"))
                                        .font(.custom(__designTimeString("#1338_21", fallback: "DMSans-Regular"), size: __designTimeInteger("#1338_22", fallback: 16)))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                
                            }
                            .padding(.vertical, __designTimeInteger("#1338_23", fallback: 8)) // Ensure spacing between header and subheader
                            .background(Color.white) // Background color for the entire block
                        }
                    }
                    .textCase(nil)  // Preserve original text case for headers
                    .listRowSeparator(.visible)


                    // Manage Privacy Profiles section with arrow
                    Section {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(__designTimeString("#1338_24", fallback: "Manage Privacy Profiles"))
                                    .font(.custom(__designTimeString("#1338_25", fallback: "DMSans-Bold"), size: __designTimeInteger("#1338_26", fallback: 18)))
                                    .foregroundColor(.black)
                                Text(__designTimeString("#1338_27", fallback: "School vs Personal"))
                                    .font(.custom(__designTimeString("#1338_28", fallback: "DMSans-Regular"), size: __designTimeInteger("#1338_29", fallback: 16)))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Image(systemName: __designTimeString("#1338_30", fallback: "chevron.right"))  // Arrow indicating more details
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, __designTimeInteger("#1338_31", fallback: 8)) // Ensure spacing between header and subheader
                        .background(Color.white) // Background color for the entire block
                    }
                    .textCase(nil)  // Preserve original text case for headers
                    .listRowSeparator(.visible)  // Ensure separator is visible between sections
                }
                .listStyle(PlainListStyle())  // Use PlainListStyle for no separators between sections
                .navigationBarTitle(__designTimeString("#1338_32", fallback: "SafeSphere"), displayMode: .large)
                .background(Color.white.edgesIgnoringSafeArea(.all))  // White background behind the list
            }
            .tabItem {
                Image(systemName: __designTimeString("#1338_33", fallback: "house.fill"))
                Text(__designTimeString("#1338_34", fallback: "Home"))
            }

            NavigationView {
                Text(__designTimeString("#1338_35", fallback: "Settings View"))
                    .navigationBarTitle(__designTimeString("#1338_36", fallback: "Settings"), displayMode: .inline)
            }
            .tabItem {
                Image(systemName: __designTimeString("#1338_37", fallback: "gear"))
                Text(__designTimeString("#1338_38", fallback: "Settings"))
            }

            NavigationView {
                Text(__designTimeString("#1338_39", fallback: "Profile View"))
                    .navigationBarTitle(__designTimeString("#1338_40", fallback: "Profile"), displayMode: .inline)
            }
            .tabItem {
                Image(systemName: __designTimeString("#1338_41", fallback: "person.crop.circle"))
                Text(__designTimeString("#1338_42", fallback: "Profile"))
            }
        }
        .accentColor(Color(red: __designTimeInteger("#1338_43", fallback: 78) / __designTimeInteger("#1338_44", fallback: 255), green: __designTimeInteger("#1338_45", fallback: 60) / __designTimeInteger("#1338_46", fallback: 255), blue: __designTimeInteger("#1338_47", fallback: 219) / __designTimeInteger("#1338_48", fallback: 255)))  // Set the selected tab item color to deep purple
        .background(Color.white.edgesIgnoringSafeArea(.all))  // Set the background color of TabView to white
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
