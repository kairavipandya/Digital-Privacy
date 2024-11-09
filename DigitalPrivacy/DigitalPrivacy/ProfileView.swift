import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) // Ensure background covers everything
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) { // Consistent spacing between sections
                    // Title Section
                    Text("Profile")
                        .font(.custom("DMSans-Bold", size: 26))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                    
                    // Profile Information Section
                    Section(header: Text("Your Info")
                                .font(.custom("DMSans-Bold", size: 18))
                                .padding(.horizontal, 16)) {
                        VStack(spacing: 16) {
                            ProfileInfoRow(title: "Name", value: "Jane Doe")
                            ProfileInfoRow(title: "Email", value: "jane.doe@gmail.com")
                            ProfileInfoRow(title: "Phone", value: "+1 (980) 123-4567")
                        }
                    }
                    
                    // Account Actions Section
                    Section(header: Text("Account")
                                .font(.custom("DMSans-Bold", size: 18))
                                .padding(.horizontal, 16)) {
                        VStack(spacing: 16) {
                            ProfileActionRow(icon: "person.crop.circle.badge.plus", title: "Edit Profile")
                            ProfileActionRow(icon: "lock", title: "Change Password")
                            ProfileActionRow(icon: "arrowshape.turn.up.right", title: "Log Out")
                        }
                    }
                    
                    // About Section
                    Section(header: Text("About")
                                .font(.custom("DMSans-Bold", size: 18))
                                .padding(.horizontal, 16)) {
                        VStack(spacing: 16) {
                            ProfileInfoRow(title: "App Version", value: "1.0.0")
                            ProfileInfoRow(title: "Developer", value: "SafeSphere Inc.")
                        }
                    }
                }
                .padding(.bottom, 20) // Add padding at the bottom
            }
        }
    }
}

// Row for Profile Information
struct ProfileInfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("DMSans-Regular", size: 16))
            Spacer()
            Text(value)
                .font(.custom("DMSans-Regular", size: 16))
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 16)
    }
}

// Row for Profile Actions
struct ProfileActionRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .imageScale(.large)
            Text(title)
                .font(.custom("DMSans-Regular", size: 16))
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
