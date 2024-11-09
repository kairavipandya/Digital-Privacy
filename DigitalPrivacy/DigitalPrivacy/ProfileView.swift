import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // User Info Section
                VStack(alignment: .center, spacing: 16) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))

                    Text("John Doe")
                        .font(.custom("DMSans-Bold", size: 22))

                    Text("johndoe@example.com")
                        .font(.custom("DMSans-Regular", size: 16))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()

                // Profile Actions
                Section(header: Text("Account")
                            .font(.custom("DMSans-Bold", size: 18))
                            .padding(.horizontal, 16)) {
                    VStack(spacing: 16) {
                        ProfileItem(icon: "person", title: "Edit Profile")
                        ProfileItem(icon: "lock.shield", title: "Change Password")
                        ProfileItem(icon: "arrowshape.turn.up.left", title: "Logout")
                    }
                }
                Spacer()
            }
            .navigationTitle("Profile")
            .padding(.top, 16)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

struct ProfileItem: View {
    let icon: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
                .imageScale(.large)
            Text(title)
                .font(.custom("DMSans-Regular", size: 16))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color.white)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
