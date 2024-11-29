import SwiftUI

struct CustomPrivacyRulesView: View {
    @State private var privacyRules = [
        Rule(name: "Location", apps: ["Facebook", "Snapchat"], timePeriod: "11:00 AM - 12:00 PM")
    ]
    @State private var recentlyAddedRule: String? // Track the recently added rule

    var body: some View {
        VStack(alignment: .leading) {
            Text("Custom Privacy Rules")
                .font(.custom("DMSans-Bold", size: 26))
                .padding(.top, 20)
                .padding(.leading, 16)

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
                    NavigationLink(
                        destination: EditRuleView(
                            rule: $privacyRules[index], // Pass binding to specific rule
                            privacyRules: $privacyRules,
                            recentlyAddedRule: $recentlyAddedRule
                        )
                    ) {
                        VStack(alignment: .leading) {
                            Text(privacyRules[index].name)
                                .font(.custom("DMSans-Bold", size: 18))
                                .foregroundColor(recentlyAddedRule == privacyRules[index].name ? .purple : .black)
                            Text("Apps: \(privacyRules[index].apps.joined(separator: ", "))")
                                .font(.custom("DMSans-Regular", size: 16))
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarTitle("Custom Privacy Rules", displayMode: .inline)
    }
}
