import SwiftUI

struct NewRulesView: View {
    @State private var selectedRuleType: String = "Select Rule Type"
    @State private var selectedApps: Set<String> = []
    @State private var startTime: String = ""
    @State private var endTime: String = ""
    @State private var showWarning = false

    @Binding var privacyRules: [Rule]

    @Environment(\.presentationMode) var presentationMode

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
                    TextField("Start Time", text: $startTime)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("End Time", text: $endTime)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
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
                if selectedRuleType != "Select Rule Type" && !selectedApps.isEmpty && !startTime.isEmpty && !endTime.isEmpty {
                    let newRule = Rule(name: selectedRuleType, apps: Array(selectedApps), timePeriod: "\(startTime) - \(endTime)")
                    privacyRules.append(newRule)
                    presentationMode.wrappedValue.dismiss()
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
    }
}

// MultiSelectView for selecting multiple apps
struct MultiSelectView: View {
    let options: [String]
    @Binding var selectedOptions: Set<String>

    var body: some View {
        VStack(alignment: .leading) {
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
                            .font(.custom("DMSans-Regular", size: 16))
                        Spacer()
                        if selectedOptions.contains(option) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        .padding()
    }
}
