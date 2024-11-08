import SwiftUI

struct CustomPrivacyRulesView: View {
    @State private var selectedRuleType = "Select"
    @State private var selectedSetRule = "Select"
    @State private var selectedProfiles = Set<String>()
    
    let ruleTypes = ["Location", "Profile Visibility", "Comment Permissions", "Facial Recognition"]
    let setRules = ["Always Off", "Only While Using App", "Always On"]
    let profiles = ["Instagram", "Facebook", "Snapchat", "Twitter"]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Title
            Text("Custom Privacy Rules")
                .font(.custom("DMSans-Bold", size: 26))
                .padding(.top, 20)
                .padding(.leading, 16)
            
            // Privacy Rules header
            HStack {
                Text("Privacy Rules")
                    .font(.custom("DMSans-Bold", size: 18))
                Spacer()
                NavigationLink(destination: NewRulesView()) {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal, 16)
            
            List {
                // Each Privacy Rule item
                privacyRuleItem(icon: "square.and.arrow.up", title: "Content Sharing")
                privacyRuleItem(icon: "message.circle", title: "Activity Status")
                privacyRuleItem(icon: "faceid", title: "Facial Recognition")
                
                // Dropdowns for selecting rule settings
                Group {
                    ruleDropdown(label: "Select Rule Type", options: ruleTypes, selection: $selectedRuleType)
                    ruleDropdown(label: "Set Rule", options: setRules, selection: $selectedSetRule)
                    MultiSelectDropdown(options: profiles, selectedOptions: $selectedProfiles)
                        .padding(.vertical)
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .navigationBarTitle("Custom Privacy Rules", displayMode: .inline)
    }

    // Reusable view for privacy rule items
    private func privacyRuleItem(icon: String, title: String) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.black)
            Text(title)
                .font(.custom("DMSans-Regular", size: 18))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }

    // Reusable dropdown view
    private func ruleDropdown(label: String, options: [String], selection: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.custom("DMSans-Regular", size: 16))
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(option) {
                        selection.wrappedValue = option
                    }
                }
            } label: {
                HStack {
                    Text(selection.wrappedValue)
                        .foregroundColor(selection.wrappedValue == "Select" ? .gray : .black)
                        .font(.custom("DMSans-Regular", size: 16))
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            }
        }
        .padding(.horizontal, 16)
    }
}
