import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var accountLocked = true

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) // Ensure background covers everything
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) { // Ensure even spacing between sections
                    // Title Section
                    Text("Settings")
                        .font(.custom("DMSans-Bold", size: 26))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.top, 16)

                    // General Section
                    Section(header: Text("General")
                                .font(.custom("DMSans-Bold", size: 18))
                                .padding(.horizontal, 16)) {
                        VStack(spacing: 16) {
                            ToggleView(title: "Enable Notifications", isOn: $notificationsEnabled)
                            ToggleView(title: "Dark Mode", isOn: $darkModeEnabled)
                        }
                    }

                    // Privacy & Security Section
                    Section(header: Text("Privacy & Security")
                                .font(.custom("DMSans-Bold", size: 18))
                                .padding(.horizontal, 16)) {
                        VStack(spacing: 16) {
                            ToggleView(title: "Account Lock", isOn: $accountLocked)
                        }
                    }

                    // About Section
                    Section(header: Text("About")
                                .font(.custom("DMSans-Bold", size: 18))
                                .padding(.horizontal, 16)) {
                        VStack(spacing: 16) {
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
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.bottom, 20) // Add padding at the bottom
            }
        }
    }
}

struct ToggleView: View {
    let title: String
    @Binding var isOn: Bool

    var body: some View {
        HStack {
            Text(title)
                .font(.custom("DMSans-Regular", size: 16))
            Spacer()
            Toggle("", isOn: $isOn)
                .toggleStyle(SwitchToggleStyle(tint: Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)))
                .labelsHidden()
        }
        .padding(.horizontal, 16)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
