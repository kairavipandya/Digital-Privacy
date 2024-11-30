import SwiftUI

struct CustomPrivacyRulesView: View {
    @State private var privacyRules = [
        Rule(name: "Location", apps: ["Facebook", "Snapchat"], timePeriod: "11:00 AM - 12:00 PM")
    ]
    @State private var recentlyAddedRule: String? // Track the recently added rule
    @State private var isEditing: Bool = false // Toggle for edit mode
    @State private var showDeleteConfirmation: Bool = false // Show confirmation dialog
    @State private var ruleToDelete: Rule? // Track the rule to delete

    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack {
                Text("Custom Privacy Rules")
                    .font(.custom("DMSans-Bold", size: 26))
                Spacer()
                // Edit Button
                Button(action: { isEditing.toggle() }) {
                    Text(isEditing ? "Done" : "Edit")
                        .font(.custom("DMSans-Bold", size: 16))
                        .foregroundColor(.blue)
                }
            }
            .padding(.top, 20)
            .padding(.leading, 16)

            // List of rules
            List {
                HStack {
                    Text("Create a New Privacy Rule")
                        .font(.custom("DMSans-Bold", size: 18))
                    Spacer()
                    NavigationLink(
                        destination: NewRulesView(
                            privacyRules: $privacyRules,
                            recentlyAddedRule: $recentlyAddedRule
                        )
                    ) {
                        Text("+")
                            .font(.custom("DMSans-Bold", size: 24))
                            .foregroundColor(.blue)
                            .padding(.trailing, 10)
                    }
                }
                .padding(.vertical, 8)

                ForEach(privacyRules.indices, id: \.self) { index in
                    ruleRow(for: privacyRules[index])
                        .overlay(
                            isEditing ? deleteButton(for: privacyRules[index]) : nil,
                            alignment: .trailing
                        )
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarTitle("Custom Privacy Rules", displayMode: .inline)
        .confirmationDialog(
            "Are you sure you want to delete this rule?",
            isPresented: $showDeleteConfirmation,
            titleVisibility: .visible
        ) {
            Button("Delete", role: .destructive) {
                if let rule = ruleToDelete {
                    deleteRule(rule)
                }
            }
            Button("Cancel", role: .cancel) {}
        }
    }

    // MARK: - Rule Row
    @ViewBuilder
    private func ruleRow(for rule: Rule) -> some View {
        NavigationLink(
            destination: EditRuleView(
                rule: Binding(
                    get: { privacyRules.first(where: { $0.name == rule.name }) ?? rule },
                    set: { updatedRule in
                        if let index = privacyRules.firstIndex(where: { $0.name == rule.name }) {
                            privacyRules[index] = updatedRule
                        }
                    }
                ),
                privacyRules: $privacyRules,
                recentlyAddedRule: $recentlyAddedRule
            )
        ) {
            VStack(alignment: .leading) {
                Text(rule.name)
                    .font(.custom("DMSans-Bold", size: 18))
                    .foregroundColor(recentlyAddedRule == rule.name ? .purple : .black)
                Text("Apps: \(rule.apps.joined(separator: ", "))")
                    .font(.custom("DMSans-Regular", size: 16))
                    .foregroundColor(.gray)
            }
        }
    }

    // MARK: - Delete Button
    @ViewBuilder
    private func deleteButton(for rule: Rule) -> some View {
        Button(action: {
            ruleToDelete = rule
            showDeleteConfirmation = true
        }) {
            Image(systemName: "trash")
                .foregroundColor(.red)
                .padding(.trailing, 10)
        }
    }

    // MARK: - Delete Rule Action
    private func deleteRule(_ rule: Rule) {
        if let index = privacyRules.firstIndex(where: { $0.name == rule.name }) {
            privacyRules.remove(at: index) // Remove the rule from the list
        }
    }
}
