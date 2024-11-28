import SwiftUI

struct CreatePrivacyProfileView: View {
    @Binding var profiles: [PrivacyProfile]

    @State private var profileName = ""
    @State private var selectedProfiles: Set<String> = []
    @State private var selectedRules: Set<String> = []
    @State private var startTime: String? = nil
    @State private var endTime: String? = nil

    @Environment(\.presentationMode) var presentationMode

    let timeOptions = [
        "12:00 AM", "1:00 AM", "2:00 AM", "3:00 AM", "4:00 AM", "5:00 AM", "6:00 AM", "7:00 AM", "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM",
        "12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM", "8:00 PM", "9:00 PM", "10:00 PM", "11:00 PM"
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Create Privacy Profile")
                    .font(.custom("DMSans-Bold", size: 26))
                    .padding(.top)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Enter Profile Name")
                        .font(.custom("DMSans-Bold", size: 16))
                        .foregroundColor(.black)
                    TextField("Profile Name", text: $profileName)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Select Profiles")
                        .font(.custom("DMSans-Bold", size: 16))
                        .foregroundColor(.black)
                    Menu {
                        ForEach(["Instagram", "Facebook", "Snapchat", "Twitter"], id: \.self) { profile in
                            Button(action: {
                                if selectedProfiles.contains(profile) {
                                    selectedProfiles.remove(profile)
                                } else {
                                    selectedProfiles.insert(profile)
                                }
                            }) {
                                Text(profile)
                                if selectedProfiles.contains(profile) {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(selectedProfiles.isEmpty ? "Select Profiles" : selectedProfiles.joined(separator: ", "))
                                .foregroundColor(selectedProfiles.isEmpty ? .gray : .black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Add Rules")
                        .font(.custom("DMSans-Bold", size: 16))
                        .foregroundColor(.black)
                    Menu {
                        ForEach(["Online Status", "Restrict Messaging", "Post Notifications", "Facial Recognition"], id: \.self) { rule in
                            Button(action: {
                                if selectedRules.contains(rule) {
                                    selectedRules.remove(rule)
                                } else {
                                    selectedRules.insert(rule)
                                }
                            }) {
                                Text(rule)
                                if selectedRules.contains(rule) {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(selectedRules.isEmpty ? "Select Rules" : selectedRules.joined(separator: ", "))
                                .foregroundColor(selectedRules.isEmpty ? .gray : .black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Set Activation Time")
                        .font(.custom("DMSans-Bold", size: 16))
                        .foregroundColor(.black)
                    HStack(spacing: 20) {
                        timeDropdown(selection: $startTime, placeholder: "Start Time")
                        timeDropdown(selection: $endTime, placeholder: "End Time")
                    }
                }

                Button(action: {
                    let newProfile = PrivacyProfile(
                        name: profileName,
                        profiles: selectedProfiles,
                        rules: selectedRules,
                        startTime: startTime ?? "Select",
                        endTime: endTime ?? "Select"
                    )
                    profiles.append(newProfile)
                    
                    profileName = ""
                    selectedProfiles = []
                    selectedRules = []
                    startTime = nil
                    endTime = nil
                    
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
                .padding(.bottom, 20)
            }
            .padding(.horizontal)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Create Privacy Profile", displayMode: .inline)
    }

    @ViewBuilder
    private func timeDropdown(selection: Binding<String?>, placeholder: String) -> some View {
        Menu {
            ForEach(timeOptions, id: \.self) { time in
                Button(action: { selection.wrappedValue = time }) {
                    Text(time)
                }
            }
        } label: {
            HStack {
                Text(selection.wrappedValue ?? placeholder)
                    .foregroundColor(selection.wrappedValue == nil ? .gray : .black)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
        }
    }
}
