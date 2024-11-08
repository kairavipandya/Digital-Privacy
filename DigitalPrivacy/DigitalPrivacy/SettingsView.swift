import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var accountLocked = true
    @State private var parentalControlEnabled = true

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("General")
                            .font(.custom("DMSans-Bold", size: 18))) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        .font(.custom("DMSans-Regular", size: 16))
                    
                    Toggle("Dark Mode", isOn: $darkModeEnabled)
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        .font(.custom("DMSans-Regular", size: 16))
                }
                
                Section(header: Text("Privacy & Security")
                            .font(.custom("DMSans-Bold", size: 18))) {
                    Toggle("Account Lock", isOn: $accountLocked)
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        .font(.custom("DMSans-Regular", size: 16))
                    
                    Toggle("Parental Control", isOn: $parentalControlEnabled)
                        .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                        .font(.custom("DMSans-Regular", size: 16))
                }

                Section(header: Text("About")
                            .font(.custom("DMSans-Bold", size: 18))) {
                    HStack {
                        Text("App Version")
                            .font(.custom("DMSans-Regular", size: 16))
                        Spacer()
                        Text("1.0.0")
                            .font(.custom("DMSans-Regular", size: 16))
                            .foregroundColor(.gray)
                    }

                    HStack {
                        Text("Developer")
                            .font(.custom("DMSans-Regular", size: 16))
                        Spacer()
                        Text("SafeSphere Inc.")
                            .font(.custom("DMSans-Regular", size: 16))
                            .foregroundColor(.gray)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
