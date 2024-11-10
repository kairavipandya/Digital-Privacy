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
            NavigationView {
                List {
                    Section(header: Text(__designTimeString("#9840_0", fallback: "My Accounts")).font(.custom(__designTimeString("#9840_1", fallback: "DMSans-Bold"), size: __designTimeInteger("#9840_2", fallback: 22)))) {
                        ForEach(accounts, id: \.name) { account in
                            NavigationLink(destination: InstagramDetailView()) {
                                HStack {
                                    Image(account.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: __designTimeInteger("#9840_3", fallback: 50), height: __designTimeInteger("#9840_4", fallback: 50))
                                        .clipShape(Circle())
                                    Text(account.name)
                                        .font(.custom(__designTimeString("#9840_5", fallback: "DMSans-Regular"), size: __designTimeInteger("#9840_6", fallback: 18)))
                                    Spacer()
                                }
                                .padding(.vertical, __designTimeInteger("#9840_7", fallback: 12))
                                .background(Color.white)
                            }
                        }
                    }
                    .textCase(nil)
                    
                    Section {
                        NavigationLink(destination: CustomPrivacyRulesView()) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(__designTimeString("#9840_8", fallback: "Custom Privacy Rules"))
                                        .font(.custom(__designTimeString("#9840_9", fallback: "DMSans-Bold"), size: __designTimeInteger("#9840_10", fallback: 18)))
                                        .foregroundColor(.black)
                                    Text(__designTimeString("#9840_11", fallback: "Apply to Multiple Accounts"))
                                        .font(.custom(__designTimeString("#9840_12", fallback: "DMSans-Regular"), size: __designTimeInteger("#9840_13", fallback: 16)))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                        }
                        .padding(.vertical, __designTimeInteger("#9840_14", fallback: 8))
                        .background(Color.white)
                    }
                    
                    Section {
                        NavigationLink(destination: PrivacyProfilesView()) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(__designTimeString("#9840_15", fallback: "Manage Privacy Profiles"))
                                        .font(.custom(__designTimeString("#9840_16", fallback: "DMSans-Bold"), size: __designTimeInteger("#9840_17", fallback: 18)))
                                        .foregroundColor(.black)
                                    Text(__designTimeString("#9840_18", fallback: "School vs Personal"))
                                        .font(.custom(__designTimeString("#9840_19", fallback: "DMSans-Regular"), size: __designTimeInteger("#9840_20", fallback: 16)))
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Image(systemName: __designTimeString("#9840_21", fallback: "chevron.right"))
                                    .foregroundColor(.gray)
                            }
                            .padding(.vertical, __designTimeInteger("#9840_22", fallback: 8))
                            .background(Color.white)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .accentColor(Color(red: __designTimeInteger("#9840_23", fallback: 78) / __designTimeInteger("#9840_24", fallback: 255), green: __designTimeInteger("#9840_25", fallback: 60) / __designTimeInteger("#9840_26", fallback: 255), blue: __designTimeInteger("#9840_27", fallback: 219) / __designTimeInteger("#9840_28", fallback: 255)))
                .navigationBarTitle(__designTimeString("#9840_29", fallback: "SafeSphere"), displayMode: .large)
                .background(Color.white.edgesIgnoringSafeArea(.all))
            }
            .tabItem {
                Image(systemName: __designTimeString("#9840_30", fallback: "house.fill"))
                Text(__designTimeString("#9840_31", fallback: "Home"))
            }
            
            NavigationView {
                Text(__designTimeString("#9840_32", fallback: "Settings View"))
                    .navigationBarTitle(__designTimeString("#9840_33", fallback: "Settings"), displayMode: .inline)
            }
            .tabItem {
                Image(systemName: __designTimeString("#9840_34", fallback: "gear"))
                Text(__designTimeString("#9840_35", fallback: "Settings"))
            }
            
            NavigationView {
                Text(__designTimeString("#9840_36", fallback: "Profile View"))
                    .navigationBarTitle(__designTimeString("#9840_37", fallback: "Profile"), displayMode: .inline)
            }
            .tabItem {
                Image(systemName: __designTimeString("#9840_38", fallback: "person.crop.circle"))
                Text(__designTimeString("#9840_39", fallback: "Profile"))
            }
        }
    }
}

// Move the PreviewProvider struct outside of the main DashboardView struct
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .previewDevice(__designTimeString("#9840_40", fallback: "iPhone 16"))
    }
}
