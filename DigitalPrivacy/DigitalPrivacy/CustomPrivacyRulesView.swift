import SwiftUI

struct CustomPrivacyRulesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Title
            Text("Custom Privacy Rules")
                .font(.custom("DMSans-Bold", size: 26))
                .padding(.top, 16)
                .padding(.leading, 16)
            
            // Privacy Rules header with "+" button aligned to the right
            HStack {
                Text("Privacy Rules")
                    .font(.custom("DMSans-Bold", size: 18))
                Spacer()
                NavigationLink(destination: NewRulesView()) {
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                        .font(.title2)
                }
                .padding(.trailing, 16)
            }
            .padding(.vertical, 8)
            .padding(.leading, 16)

            // List with Privacy Rules
            List {
                // Content Sharing item
                PrivacyRuleListItem(iconName: "square.and.arrow.up", title: "Content Sharing")
                
                // Activity Status item
                PrivacyRuleListItem(iconName: "message.circle", title: "Activity Status")
                
                // Facial Recognition item
                PrivacyRuleListItem(iconName: "faceid", title: "Facial Recognition")
            }
            .listStyle(PlainListStyle())
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Custom Privacy Rules", displayMode: .inline)
    }
}

// Helper view for individual list items
struct PrivacyRuleListItem: View {
    let iconName: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
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
}

struct CustomPrivacyRulesView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPrivacyRulesView()
    }
}
