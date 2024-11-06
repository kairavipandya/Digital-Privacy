import SwiftUI

struct CreatePrivacyProfileView: View {
    @State private var profileName = ""
    @State private var selectedProfiles: Set<String> = []  // For multi-select dropdown
    @State private var selectedRule = ""
    @State private var startTime = ""
    @State private var endTime = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("")
                .font(.custom("DMSans-Bold", size: 24))
                .padding(.top)

            Group {
                Text("Enter Profile Name")
                    .font(.custom("DMSans-Regular", size: 16))
                TextField("Profile Name", text: $profileName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)

                // Multi-select dropdown for selecting profiles
                MultiSelectDropdown(options: ["Instagram", "Facebook", "Snapchat", "Twitter"], selectedOptions: $selectedProfiles)
                    .padding(.bottom)

                Text("Add Rules")
                    .font(.custom("DMSans-Regular", size: 16))
                Picker("Select", selection: $selectedRule) {
                    Text("Select").tag("")
                    Text("Rule 1").tag("Rule 1")
                    Text("Rule 2").tag("Rule 2")
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.bottom)

                Text("Set Activation Start Time")
                    .font(.custom("DMSans-Regular", size: 16))
                Picker("Select", selection: $startTime) {
                    Text("Select").tag("")
                    Text("3:00 PM").tag("3:00 PM")
                    Text("4:00 PM").tag("4:00 PM")
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.bottom)

                Text("Set Activation End Time")
                    .font(.custom("DMSans-Regular", size: 16))
                Picker("Select", selection: $endTime) {
                    Text("Select").tag("")
                    Text("8:00 AM").tag("8:00 AM")
                    Text("9:00 AM").tag("9:00 AM")
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.bottom)
            }

            Spacer()

            Button(action: {
                print("Rule applied with profile name: \(profileName) and selected profiles: \(selectedProfiles.joined(separator: ", "))")
            }) {
                Text("APPLY RULE")
                    .font(.custom("DMSans-Bold", size: 16))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
        .padding()
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Create New Privacy Profile", displayMode: .inline)
    }
}
