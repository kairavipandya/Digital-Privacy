import SwiftUI

struct CreatePrivacyProfileView: View {
    @State private var profileName = ""
    @State private var selectedProfiles: Set<String> = []
    @State private var selectedRules: Set<String> = []
    @State private var startTime = "Select"
    @State private var endTime = "Select"

    let timeOptions = [
        "12:00 AM", "1:00 AM", "2:00 AM", "3:00 AM", "4:00 AM", "5:00 AM", "6:00 AM", "7:00 AM", "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM",
        "12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM", "9:00 PM", "10:00 PM", "11:00 PM"
    ]

    @Environment(\.presentationMode) var presentationMode
    @Binding var profiles: [PrivacyProfile]

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
                MultiSelectDropdown(options: ["Online Status", "Restrict Messaging", "Post Notifications", "Facial Recognition"], selectedOptions: $selectedRules)
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
                let newProfile = PrivacyProfile(name: profileName, profiles: selectedProfiles, rules: selectedRules, startTime: startTime, endTime: endTime)
                profiles.append(newProfile)
                presentationMode.wrappedValue.dismiss()
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
            .padding(.bottom, 10)
        }
        .padding()
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Create New Privacy Profile", displayMode: .inline)
    }
}

// A sample multi-select dropdown component for profiles and rules
struct MultiSelectDropdown: View {
    let options: [String]
    @Binding var selectedOptions: Set<String>

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    if selectedOptions.contains(option) {
                        selectedOptions.remove(option)
                    } else {
                        selectedOptions.insert(option)
                    }
                }) {
                    HStack {
                        Text(option)
                        if selectedOptions.contains(option) {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            HStack {
                Text(selectedOptions.isEmpty ? "Select" : selectedOptions.joined(separator: ", "))
                    .foregroundColor(selectedOptions.isEmpty ? .gray : .black)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
        }
    }
}
