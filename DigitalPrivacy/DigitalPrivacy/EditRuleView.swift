import SwiftUI

struct EditRuleView: View {
    @Binding var rule: Rule // Bind to a specific rule for editing
    @Binding var privacyRules: [Rule] // Full list of rules for additional updates
    @Binding var recentlyAddedRule: String?

    @Environment(\.presentationMode) var presentationMode // For dismissing the view

    var body: some View {
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

            // Time Period
            VStack(alignment: .leading) {
                Text("Set Time Period")
                    .font(.custom("DMSans-Bold", size: 16))
                HStack {
                    TextField("Start Time", text: $rule.timePeriod)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }

            Spacer()

            Button(action: {
                recentlyAddedRule = rule.name
                presentationMode.wrappedValue.dismiss()
            }) {
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
        .navigationBarTitle("Edit Privacy Rule", displayMode: .inline)
    }
}
