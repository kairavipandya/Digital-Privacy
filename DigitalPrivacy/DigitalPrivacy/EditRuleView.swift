import SwiftUI

struct EditRuleView: View {
    @State var rule: Rule
    @Binding var privacyRules: [Rule]
    @Binding var recentlyEditedRule: Rule?

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Edit Rule")
                .font(.custom("DMSans-Bold", size: 26))
                .padding(.top, 20)
                .padding(.leading, 16)

            // Edit Rule Type
            VStack(alignment: .leading, spacing: 5) {
                Text("Rule Type")
                    .font(.custom("DMSans-Bold", size: 16))
                Menu {
                    Button("Location") { rule.name = "Location" }
                    Button("Profile Visibility") { rule.name = "Profile Visibility" }
                    Button("Comment Permissions") { rule.name = "Comment Permissions" }
                } label: {
                    HStack {
                        Text(rule.name)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                }
            }
            .padding(.horizontal, 16)

            // Edit Apps
            VStack(alignment: .leading, spacing: 5) {
                Text("Apps")
                    .font(.custom("DMSans-Bold", size: 16))
                MultiSelectView(options: ["Instagram", "Snapchat", "Facebook", "Twitter"], selectedOptions: Binding(
                    get: { Set(rule.apps) },
                    set: { rule.apps = Array($0) }
                ))
            }
            .padding(.horizontal, 16)

            // Edit Time Period
            VStack(alignment: .leading, spacing: 5) {
                Text("Time Period")
                    .font(.custom("DMSans-Bold", size: 16))
                HStack {
                    TextField("Start Time", text: Binding(
                        get: { rule.timePeriod.split(separator: "-").first?.trimmingCharacters(in: .whitespaces) ?? "" },
                        set: { newValue in
                            if let endTime = rule.timePeriod.split(separator: "-").last {
                                rule.timePeriod = "\(newValue) - \(endTime)"
                            }
                        }
                    ))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("End Time", text: Binding(
                        get: { rule.timePeriod.split(separator: "-").last?.trimmingCharacters(in: .whitespaces) ?? "" },
                        set: { newValue in
                            if let startTime = rule.timePeriod.split(separator: "-").first {
                                rule.timePeriod = "\(startTime) - \(newValue)"
                            }
                        }
                    ))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding(.horizontal, 16)

            Spacer()

            // Save Button
            Button(action: {
                if let index = privacyRules.firstIndex(where: { $0.id == rule.id }) {
                    privacyRules[index] = rule
                    recentlyEditedRule = rule
                }
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("SAVE CHANGES")
                    .font(.custom("DMSans-Bold", size: 18))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
            }
        }
        .navigationBarTitle("Edit Rule", displayMode: .inline)
    }
}

struct EditRuleView_Previews: PreviewProvider {
    static var previews: some View {
        EditRuleView(
            rule: Rule(name: "Location", apps: ["Facebook", "Snapchat"], timePeriod: "11:00 AM - 12:00 PM"),
            privacyRules: .constant([]),
            recentlyEditedRule: .constant(nil)
        )
    }
}
