import SwiftUI
import Foundation

struct EditPrivacyProfileView: View {
    @Binding var profile: PrivacyProfile
    @Binding var profiles: [PrivacyProfile]

    @Environment(\.presentationMode) var presentationMode // For dismissing the view
    @State private var showConfirmation: Bool = false // Show confirmation message
    @State private var showWarning: Bool = false // Show validation warning

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Edit Privacy Profile")
                    .font(.custom("DMSans-Bold", size: 24))
                    .padding(.top)

                // Profile Name
                inputField(title: "Profile Name", text: $profile.name)

                // Multi-Select for Profiles
                section(title: "Select Profiles") {
                    MultiSelectView(
                        options: ["Instagram", "Facebook", "Snapchat", "Twitter"],
                        selectedOptions: $profile.profiles
                    )
                }

                // Multi-Select for Rules
                section(title: "Add Rules") {
                    MultiSelectView(
                        options: ["Online Status", "Restrict Messaging", "Post Notifications", "Facial Recognition"],
                        selectedOptions: $profile.rules
                    )
                }

                // Time Period
                section(title: "Activation Time") {
                    timePeriodInputs
                }

                if showWarning {
                    Text("All fields are required!")
                        .font(.custom("DMSans-Regular", size: 14))
                        .foregroundColor(.red)
                }

                Spacer()

                // Save Changes Button
                Button(action: saveChanges) {
                    Text("SAVE CHANGES")
                        .font(.custom("DMSans-Bold", size: 16))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarTitle("Edit Privacy Profile", displayMode: .inline)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .overlay(
            Group {
                if showConfirmation {
                    confirmationOverlay
                }
            }
        )
    }

    // MARK: - Components

    @ViewBuilder
    private func inputField(title: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.custom("DMSans-Bold", size: 16))
            TextField("Enter \(title)", text: text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5))
                )
        }
    }

    @ViewBuilder
    private func section<T: View>(title: String, @ViewBuilder content: () -> T) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.custom("DMSans-Bold", size: 16))
            content()
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5))
                        .background(Color.white)
                )
        }
    }

    @ViewBuilder
    private var timePeriodInputs: some View {
        HStack(spacing: 20) {
            TextField("Start Time", text: $profile.startTime)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5))
                )
            TextField("End Time", text: $profile.endTime)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5))
                )
        }
    }

    // MARK: - Save Changes Action
    private func saveChanges() {
        if profile.name.isEmpty ||
            profile.profiles.isEmpty ||
            profile.rules.isEmpty ||
            profile.startTime.isEmpty ||
            profile.endTime.isEmpty {
            showWarning = true // Show warning if any field is empty
        } else {
            showWarning = false
            if let index = profiles.firstIndex(where: { $0.id == profile.id }) {
                profiles[index] = profile
            }
            showConfirmation = true // Show confirmation message
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                showConfirmation = false
                presentationMode.wrappedValue.dismiss()
            }
        }
    }

    // MARK: - Confirmation Overlay
    @ViewBuilder
    private var confirmationOverlay: some View {
        Text("Changes Saved!")
            .font(.custom("DMSans-Bold", size: 16))
            .foregroundColor(.white)
            .padding()
            .background(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255)) // Purple color
            .cornerRadius(10)
            .shadow(radius: 10)
            .frame(maxWidth: .infinity)
            .padding()
            .transition(.opacity)
            .animation(.easeInOut, value: showConfirmation)
    }
}

// Preview
struct EditPrivacyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditPrivacyProfileView(
            profile: .constant(PrivacyProfile(name: "Personal", profiles: ["Instagram"], rules: ["Online Status"], startTime: "8:00 AM", endTime: "5:00 PM")),
            profiles: .constant([])
        )
    }
}
