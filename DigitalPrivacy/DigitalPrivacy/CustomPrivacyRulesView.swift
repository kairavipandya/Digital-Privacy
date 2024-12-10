import SwiftUI

struct CustomPrivacyRulesView: View {
    @State private var privacyRules = [
        Rule(name: "Location", apps: Set(["Facebook", "Snapchat"]), timePeriod: "11:00 AM - 12:00 PM", icon: "location.circle")
    ]

    @State private var recentlyAddedRule: String? // Track the recently added rule
    @State private var isEditing: Bool = false // Toggle for edit mode
    @State private var showDeleteConfirmation: Bool = false // Show confirmation dialog
    @State private var ruleToDelete: Rule? // Track the rule to delete
    @State private var searchText: String = "" // Text for the search bar

    var body: some View {
        VStack(alignment: .leading) {
            // Header
            VStack(alignment: .leading, spacing: 8) {
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
                    .padding(.trailing, 16) // Add padding to move the button inward
                }

                // Description
                Text("Privacy Rule: Unified privacy settings for all your accounts.")
                    .font(.custom("DMSans-Regular", size: 16))
                    .foregroundColor(.gray)
                    .padding(.leading, 16)
            }
            .padding(.top, 20)
            .padding(.leading, 16)

            // Search Bar
            VStack {
                TextField("Search Privacy Rules", text: $searchText)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5))
                    )
                    .padding(.horizontal, 16)
            }
            .padding(.top, 10)

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

                ForEach(filteredRules.indices, id: \.self) { index in
                    ruleRow(for: filteredRules[index])
                        .overlay(
                            isEditing ? deleteButton(for: filteredRules[index]) : nil,
                            alignment: .trailing
                        )
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarTitle("", displayMode: .inline)
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

    // MARK: - Filtered Rules
    private var filteredRules: [Rule] {
        if searchText.isEmpty {
            return privacyRules
        } else {
            return privacyRules.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }

    // MARK: - Rule Row
    @ViewBuilder
    private func ruleRow(for rule: Rule) -> some View {
        NavigationLink(
            destination: EditRuleView(
                rule: Binding(
                    get: { privacyRules.first(where: { $0.id == rule.id }) ?? rule },
                    set: { updatedRule in
                        if let index = privacyRules.firstIndex(where: { $0.id == rule.id }) {
                            privacyRules[index] = updatedRule
                        }
                    }
                ),
                privacyRules: $privacyRules,
                recentlyAddedRule: $recentlyAddedRule
            )
        ) {
            HStack {
                Image(systemName: rule.icon) // Display the rule's icon
                    .foregroundColor(.blue)
                    .imageScale(.large)
                    .padding(.trailing, 10)
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
