import SwiftUI

struct CreatePrivacyProfileView: View {
    @Binding var profiles: [PrivacyProfile]
    @State private var profileName = ""
    @State private var selectedProfiles: Set<String> = []
    @State private var selectedRules: Set<String> = []
    @State private var startTime: String? = nil
    @State private var endTime: String? = nil
    @State private var showWarning = false
    @State private var showConfirmation = false

    @Environment(\.presentationMode) var presentationMode // For dismissing the view

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

                // Profile Name Input
                inputField(title: "Profile Name", placeholder: "Enter Profile Name", text: $profileName)

                // Select Profiles Dropdown
                dropdownSection(title: "Select Profiles") {
                    MultiSelectDropdown(options: ["Instagram", "Facebook", "Snapchat", "Twitter"], selectedOptions: $selectedProfiles)
                }

                // Add Rules Dropdown
                dropdownSection(title: "Select Rules") {
                    MultiSelectDropdown(options: ["Online Status", "Restrict Messaging", "Post Notifications", "Facial Recognition"], selectedOptions: $selectedRules)
                }

                // Set Activation Time
                dropdownSection(title: "Set Activation Time") {
                    timeSelectionMenu()
                }

                if showWarning {
                    Text("Please fill out all required fields.")
                        .foregroundColor(.red)
                        .font(.custom("DMSans-Regular", size: 14))
                }

                applyButton
            }
            .padding(.horizontal)
        }
        .overlay(
            Group {
                if showConfirmation {
                    confirmationOverlay
                }
            }
        )
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Create Privacy Profile", displayMode: .inline)
    }

    // MARK: - Components
    @ViewBuilder
    private func inputField(title: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.custom("DMSans-Bold", size: 16))
                .foregroundColor(.black)
            TextField(placeholder, text: text)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5)))
        }
    }

    @ViewBuilder
    private func dropdownSection<T: View>(title: String, @ViewBuilder content: () -> T) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.custom("DMSans-Bold", size: 16))
                .foregroundColor(.black)
            content()
        }
    }

    @ViewBuilder
    private func timeSelectionMenu() -> some View {
        HStack(spacing: 20) {
            timeDropdown(selectedOption: $startTime)
            timeDropdown(selectedOption: $endTime)
        }
    }

    @ViewBuilder
    private func timeDropdown(selectedOption: Binding<String?>) -> some View {
        Menu {
            ForEach(timeOptions, id: \.self) { time in
                Button(action: { selectedOption.wrappedValue = time }) {
                    Text(time)
                }
            }
        } label: {
            HStack {
                Text(selectedOption.wrappedValue ?? "Select Time")
                    .foregroundColor(selectedOption.wrappedValue == nil ? .gray : .black)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5)))
        }
    }

    @ViewBuilder
    private var applyButton: some View {
        Button(action: saveProfile) {
            Text("APPLY RULE")
                .font(.custom("DMSans-Bold", size: 16))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
                .cornerRadius(10)
        }
        .padding(.bottom, 20)
    }

    @ViewBuilder
    private var confirmationOverlay: some View {
        Text("Privacy Profile Saved!")
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .shadow(radius: 10)
            .transition(.opacity)
            .animation(.easeInOut)
    }

    // MARK: - Actions
    private func saveProfile() {
        if profileName.isEmpty || selectedProfiles.isEmpty || selectedRules.isEmpty || startTime == nil || endTime == nil {
            showWarning = true
        } else {
            let newProfile = PrivacyProfile(
                name: profileName,
                profiles: selectedProfiles,
                rules: selectedRules,
                startTime: startTime ?? "",
                endTime: endTime ?? ""
            )
            profiles.append(newProfile)
            showConfirmation = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
