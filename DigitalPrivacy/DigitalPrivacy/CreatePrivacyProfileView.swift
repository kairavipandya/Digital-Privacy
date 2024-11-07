import SwiftUI

struct CreatePrivacyProfileView: View {
    @State private var profileName = ""
    @State private var selectedProfiles: Set<String> = []
    @State private var selectedRule = ""
    @State private var startTime = "Select"
    @State private var endTime = "Select"

    let timeOptions = [
        "12:00 AM", "1:00 AM", "2:00 AM", "3:00 AM", "4:00 AM", "5:00 AM", "6:00 AM", "7:00 AM", "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM",
        "12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM", "9:00 PM", "10:00 PM", "11:00 PM"
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create New Privacy Profile")
                .font(.custom("DMSans-Bold", size: 24))
                .padding(.top)

            Group {
                Text("Enter Profile Name")
                    .font(.custom("DMSans-Regular", size: 16))
                TextField("Profile Name", text: $profileName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)

                MultiSelectDropdown(options: ["Instagram", "Facebook", "Snapchat", "Twitter"], selectedOptions: $selectedProfiles)
                    .padding(.bottom)

                Text("Add Rules")
                    .font(.custom("DMSans-Regular", size: 16))
                Picker("Select", selection: $selectedRule) {
                    Text("Select").tag("")
                    Text("Online Status").tag("Online Status")
                    Text("Restrict Messaging").tag("Restrict Messaging")
                    Text("Post Notifications").tag("Post Notifications")
                    Text("Facial Recognition").tag("Facial Recognition")
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.bottom)

                Text("Set Activation Start Time")
                    .font(.custom("DMSans-Regular", size: 16))
                Picker("Select", selection: $startTime) {
                    ForEach(timeOptions, id: \.self) { time in
                        Text(time).tag(time)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.bottom)

                Text("Set Activation End Time")
                    .font(.custom("DMSans-Regular", size: 16))
                Picker("Select", selection: $endTime) {
                    ForEach(timeOptions, id: \.self) { time in
                        Text(time).tag(time)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding(.bottom)
            }

            Spacer()

            Button(action: {
                print("Profile Name: \(profileName), Selected Profiles: \(selectedProfiles), Rule: \(selectedRule), Start Time: \(startTime), End Time: \(endTime)")
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
