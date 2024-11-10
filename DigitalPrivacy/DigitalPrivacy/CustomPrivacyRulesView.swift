import SwiftUI

struct CustomPrivacyRulesView: View {
    // State variable for the list of privacy rules
    @State private var privacyRules = ["Content Sharing", "Activity Status", "Facial Recognition"]
    @State private var recentlyAddedRule: String? // To track the newly added rule

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
                    NavigationLink(destination: NewRulesView(privacyRules: $privacyRules, recentlyAddedRule: $recentlyAddedRule)) {
                        Text("+")
                            .font(.custom("DMSans-Bold", size: 24))
                            .foregroundColor(.blue)
                            .padding(.trailing, 10)
                    }
                }
                .padding(.vertical, 8)
                
                // Dynamically show the list of privacy rules
                ForEach(privacyRules, id: \.self) { rule in
                    HStack {
                        Image(systemName: getIcon(for: rule))
                            .font(.title2)
                            .foregroundColor(.black)
                        Text(rule)
                            .font(.custom("DMSans-Regular", size: 18))
                            .foregroundColor(recentlyAddedRule == rule ? .blue : .black) // Highlight new rule
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationBarTitle("Custom Privacy Rules", displayMode: .inline)
    }

    // Helper function to get icon based on rule type
    func getIcon(for rule: String) -> String {
        switch rule {
        case "Content Sharing":
            return "square.and.arrow.up"
        case "Activity Status":
            return "message.circle"
        case "Facial Recognition":
            return "faceid"
        case "Location":
            return "location.circle"
        default:
            return "questionmark.circle"
        }
    }
}

struct CustomPrivacyRulesView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPrivacyRulesView()
    }
}
