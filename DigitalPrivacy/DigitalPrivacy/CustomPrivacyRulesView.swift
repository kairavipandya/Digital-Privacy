import SwiftUI

struct CustomPrivacyRulesView: View {
    @State private var privacyRules = [
        Rule(name: "Location", apps: ["Facebook", "Snapchat"], timePeriod: "11:00 AM - 12:00 PM")
    ]
    @State private var recentlyEditedRule: Rule?

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
                    NavigationLink(destination: NewRulesView(privacyRules: $privacyRules)) {
                        Text("+")
                            .font(.custom("DMSans-Bold", size: 24))
                            .foregroundColor(.blue)
                            .padding(.trailing, 10)
                    }
                }
                .padding(.vertical, 8)

                ForEach(privacyRules, id: \.name) { rule in
                    NavigationLink(destination: EditRuleView(rule: rule, privacyRules: $privacyRules, recentlyEditedRule: $recentlyEditedRule)) {
                        VStack(alignment: .leading) {
                            Text(rule.name)
                                .font(.custom("DMSans-Bold", size: 18))
                            Text("Apps: \(rule.apps.joined(separator: ", "))")
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
