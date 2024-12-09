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
                    Section(header: Text(__designTimeString("#2293_0", fallback: "My Accounts")).font(.custom(__designTimeString("#2293_1", fallback: "DMSans-Bold"), size: __designTimeInteger("#2293_2", fallback: 22)))) {
                        ForEach(accounts, id: \.name) { account in
                            NavigationLink(destination: InstagramDetailView()) {
                                HStack {
                                    Image(account.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: __designTimeInteger("#2293_3", fallback: 50), height: __designTimeInteger("#2293_4", fallback: 50))
                                        .clipShape(Circle())
                                    Text(account.name)
                                        .font(.custom(__designTimeString("#2293_5", fallback: "DMSans-Regular"), size: __designTimeInteger("#2293_6", fallback: 18)))
                                    Spacer()
                                }
                                .padding(.vertical, __designTimeInteger("#2293_7", fallback: 12))
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
                                    Text(__designTimeString("#2293_8", fallback: "Custom Privacy Rules"))
                                        .font(.custom(__designTimeString("#2293_9", fallback: "DMSans-Bold"), size: __designTimeInteger("#2293_10", fallback: 18)))
                                        .foregroundColor(.black)
                                    Text(__designTimeString("#2293_11", fallback: "Apply to Multiple Accounts"))
                                        .font(.custom(__designTimeString("#2293_12", fallback: "DMSans-Regular"), size: __designTimeInteger("#2293_13", fallback: 16)))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                        }
                        .padding(.vertical, __designTimeInteger("#2293_14", fallback: 8))
                        .background(Color.white)
                    }
                    
                    // Manage Privacy Profiles Section
                    Section {
                        NavigationLink(destination: PrivacyProfilesView()) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(__designTimeString("#2293_15", fallback: "Manage Privacy Profiles"))
                                        .font(.custom(__designTimeString("#2293_16", fallback: "DMSans-Bold"), size: __designTimeInteger("#2293_17", fallback: 18)))
                                        .foregroundColor(.black)
                                    Text(__designTimeString("#2293_18", fallback: "School vs Personal"))
                                        .font(.custom(__designTimeString("#2293_19", fallback: "DMSans-Regular"), size: __designTimeInteger("#2293_20", fallback: 16)))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(.vertical, __designTimeInteger("#2293_21", fallback: 8))
                            .background(Color.white)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .accentColor(Color(red: __designTimeInteger("#2293_22", fallback: 78) / __designTimeInteger("#2293_23", fallback: 255), green: __designTimeInteger("#2293_24", fallback: 60) / __designTimeInteger("#2293_25", fallback: 255), blue: __designTimeInteger("#2293_26", fallback: 219) / __designTimeInteger("#2293_27", fallback: 255))) // Set the accent color
                .navigationBarTitle(__designTimeString("#2293_28", fallback: "SafeSphere"), displayMode: .large)
                .background(Color.white.edgesIgnoringSafeArea(.all))
            }
            .tabItem {
                Image(systemName: __designTimeString("#2293_29", fallback: "house.fill"))
                Text(__designTimeString("#2293_30", fallback: "Home"))
            }
            
            // Settings Tab
            NavigationView {
                SettingsView() // Link to the SettingsView
                    .navigationBarTitle(__designTimeString("#2293_31", fallback: "Settings"), displayMode: .inline)
            }
            .tabItem {
                Image(systemName: __designTimeString("#2293_32", fallback: "gear"))
                Text(__designTimeString("#2293_33", fallback: "Settings"))
            }
            
            // Profile Tab
            NavigationView {
                ProfileView() // Link to the ProfileView
                    .navigationBarTitle(__designTimeString("#2293_34", fallback: "Profile"), displayMode: .inline)
            }
            .tabItem {
                Image(systemName: __designTimeString("#2293_35", fallback: "person.crop.circle"))
                Text(__designTimeString("#2293_36", fallback: "Profile"))
            }
        }
        .accentColor(Color(red: __designTimeInteger("#2293_37", fallback: 78) / __designTimeInteger("#2293_38", fallback: 255), green: __designTimeInteger("#2293_39", fallback: 60) / __designTimeInteger("#2293_40", fallback: 255), blue: __designTimeInteger("#2293_41", fallback: 219) / __designTimeInteger("#2293_42", fallback: 255))) // Set the global TabView accent color
    }
}

// Move the PreviewProvider struct outside of the main DashboardView struct
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .previewDevice(__designTimeString("#2293_43", fallback: "iPhone 16"))
    }
}
