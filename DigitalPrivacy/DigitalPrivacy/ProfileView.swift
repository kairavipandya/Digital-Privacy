import SwiftUI

struct ProfileView: View {
    @State private var childName = "Alex"
    @State private var age = "10"
    @State private var privacySettings = [
        "Online Status": false,
        "Restrict Messaging": true,
        "Post Notifications": false,
        "Location Services": false
    ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Profile")
                    .font(.custom("DMSans-Bold", size: 24))
                    .padding(.top, 20)
                
                HStack {
                    Text("Name:")
                        .font(.custom("DMSans-Regular", size: 18))
                    Spacer()
                    Text(childName)
                        .font(.custom("DMSans-Regular", size: 18))
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("Age:")
                        .font(.custom("DMSans-Regular", size: 18))
                    Spacer()
                    Text(age)
                        .font(.custom("DMSans-Regular", size: 18))
                        .foregroundColor(.gray)
                }
                
                Divider()
                
                Text("Privacy Settings")
                    .font(.custom("DMSans-Bold", size: 18))
                    .padding(.bottom, 10)
                
                ForEach(privacySettings.keys.sorted(), id: \.self) { setting in
                    Toggle(setting, isOn: Binding(
                        get: { self.privacySettings[setting] ?? false },
                        set: { self.privacySettings[setting] = $0 }
                    ))
                    .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                    .font(.custom("DMSans-Regular", size: 16))
                    .padding(.vertical, 8)
                }
                
                Spacer()
            }
            .padding()
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
