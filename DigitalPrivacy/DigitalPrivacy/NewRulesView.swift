import SwiftUI

struct NewRulesView: View {
    @State private var selectedRuleType: String = "Select Rule Type"
    @State private var selectedApps: Set<String> = []
    @State private var startTime: String = "Select Time"
    @State private var endTime: String = "Select Time"
    @State private var showWarning = false
    @State private var showConfirmation = false

    @Binding var privacyRules: [Rule]

    @Environment(\.presentationMode) var presentationMode

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
        VStack(alignment: .leading, spacing: 20) {
            Text("Create New Rule")
                .font(.custom("DMSans-Bold", size: 26))
                .padding(.top, 20)
                .padding(.leading, 16)

            // Rule Type Section
            VStack(alignment: .leading, spacing: 5) {
                Text("Select Rule Type")
                    .font(.custom("DMSans-Bold", size: 16))
                Menu {
                    Button("Location") { selectedRuleType = "Location" }
                    Button("Profile Visibility") { selectedRuleType = "Profile Visibility" }
                    Button("Comment Permissions") { selectedRuleType = "Comment Permissions" }
                } label: {
                    HStack {
                        Text(selectedRuleType)
                            .foregroundColor(selectedRuleType == "Select Rule Type" ? .gray : .black)
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                }
            }
            .padding(.horizontal, 16)

            // App Selection Section
            VStack(alignment: .leading, spacing: 5) {
                Text("Select Apps")
                    .font(.custom("DMSans-Bold", size: 16))
                MultiSelectView(options: ["Instagram", "Snapchat", "Facebook", "Twitter"], selectedOptions: $selectedApps)
            }
            .padding(.horizontal, 16)

            // Time Period Section
            VStack(alignment: .leading, spacing: 5) {
                Text("Set Time Period")
                    .font(.custom("DMSans-Bold", size: 16))
                HStack {
                    Menu {
                        ForEach(timeOptions, id: \.self) { time in
                            Button(time) { startTime = time }
                        }
                    } label: {
                        HStack {
                            Text(startTime)
                                .foregroundColor(startTime == "Select Time" ? .gray : .black)
                            Spacer()
                            Image(systemName: "chevron.down")
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                    }

                    Menu {
                        ForEach(timeOptions, id: \.self) { time in
                            Button(time) { endTime = time }
                        }
                    } label: {
                        HStack {
                            Text(endTime)
                                .foregroundColor(endTime == "Select Time" ? .gray : .black)
                            Spacer()
                            Image(systemName: "chevron.down")
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                    }
                }
            }
            .padding(.horizontal, 16)

            Spacer()

            if showWarning {
                Text("Please fill out all required fields.")
                    .font(.custom("DMSans-Regular", size: 14))
                    .foregroundColor(.red)
                    .padding(.horizontal, 16)
            }

            // Apply Rule Button
            Button(action: {
                if selectedRuleType != "Select Rule Type" && !selectedApps.isEmpty && startTime != "Select Time" && endTime != "Select Time" {
                    let newRule = Rule(name: selectedRuleType, apps: Array(selectedApps), timePeriod: "\(startTime) - \(endTime)")
                    privacyRules.append(newRule)
                    showConfirmation = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        presentationMode.wrappedValue.dismiss()
                    }
                } else {
                    showWarning = true
                }
            }) {
                Text("APPLY RULE")
                    .font(.custom("DMSans-Bold", size: 18))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
            }
        }
        .navigationBarTitle("Create New Rule", displayMode: .inline)
        .overlay(
            Group {
                if showConfirmation {
                    Text("Rule successfully saved!")
                        .font(.custom("DMSans-Bold", size: 16))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .transition(.opacity)
                        .animation(.easeInOut)
                }
            }
        )
    }
}
