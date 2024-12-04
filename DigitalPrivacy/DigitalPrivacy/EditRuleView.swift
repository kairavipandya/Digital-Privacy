import SwiftUI

struct EditRuleView: View {
    @Binding var rule: Rule // Bind to a specific rule for editing
    @Binding var privacyRules: [Rule] // Full list of rules for additional updates
    @Binding var recentlyAddedRule: String?

    @Environment(\.presentationMode) var presentationMode // For dismissing the view

    @State private var startTime: String = "" // Separate state for start time
    @State private var endTime: String = "" // Separate state for end time
    @State private var showWarning: Bool = false // Show validation warning
    @State private var showConfirmation: Bool = false // Show confirmation message

    let timeOptions = [
        "12:00 AM", "12:30 AM", "1:00 AM", "1:30 AM", "2:00 AM", "2:30 AM",
        "3:00 AM", "3:30 AM", "4:00 AM", "4:30 AM", "5:00 AM", "5:30 AM",
        "6:00 AM", "6:30 AM", "7:00 AM", "7:30 AM", "8:00 AM", "8:30 AM",
        "9:00 AM", "9:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM",
        "12:00 PM", "12:30 PM", "1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM",
        "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM",
        "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM",
        "9:00 PM", "9:30 PM", "10:00 PM", "10:30 PM", "11:00 PM", "11:30 PM"
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Edit Privacy Rule")
                    .font(.custom("DMSans-Bold", size: 24))
                    .padding(.top)

                // Rule Type
                VStack(alignment: .leading) {
                    Text("Rule Name")
                        .font(.custom("DMSans-Bold", size: 16))
                    TextField("Rule Name", text: $rule.name)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5)))
                }

                // App Selection
                VStack(alignment: .leading) {
                    Text("Select Apps")
                        .font(.custom("DMSans-Bold", size: 16))
                    MultiSelectView(
                        options: ["Instagram", "Facebook", "Snapchat", "Twitter"],
                        selectedOptions: $rule.apps // Updated to use Set<String>
                    )
                }

                // Time Period Selection
                VStack(alignment: .leading) {
                    Text("Set Time Period")
                        .font(.custom("DMSans-Bold", size: 16))
                    HStack {
                        timeDropdown(selectedOption: $startTime, placeholder: "Start Time")
                        timeDropdown(selectedOption: $endTime, placeholder: "End Time")
                    }
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
        .navigationBarTitle("Edit Privacy Rule", displayMode: .inline)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .overlay(
            Group {
                if showConfirmation {
                    confirmationOverlay
                }
            }
        )
    }

    // MARK: - Time Dropdown
    @ViewBuilder
    private func timeDropdown(selectedOption: Binding<String>, placeholder: String) -> some View {
        Menu {
            ForEach(timeOptions, id: \.self) { time in
                Button(action: { selectedOption.wrappedValue = time }) {
                    Text(time)
                }
            }
        } label: {
            HStack {
                Text(selectedOption.wrappedValue.isEmpty ? placeholder : selectedOption.wrappedValue)
                    .foregroundColor(selectedOption.wrappedValue.isEmpty ? .gray : .black)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5)))
        }
    }

    // MARK: - Save Changes Action
    private func saveChanges() {
        if rule.name.isEmpty || rule.apps.isEmpty || startTime.isEmpty || endTime.isEmpty {
            showWarning = true // Show warning if any field is empty
        } else {
            showWarning = false
            rule.timePeriod = "\(startTime) - \(endTime)"
            recentlyAddedRule = rule.name
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
