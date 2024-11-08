import SwiftUI

struct NewRulesView: View {
    // State variables to store selected options
    @State private var selectedRuleType: String = "Select"
    @State private var selectedRule: String = "Select"
    @State private var selectedProfile: String = "Select"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Title
            Text("Create New Rule")
                .font(.custom("DMSans-Bold", size: 26))
                .padding(.top, 20)
                .padding(.leading, 16)
            
            // Select Rule Type
            VStack(alignment: .leading, spacing: 5) {
                Text("Select Rule Type")
                    .font(.custom("DMSans-Bold", size: 16))
                    .foregroundColor(.black)
                Menu {
                    Button("Location") { selectedRuleType = "Location" }
                    Button("Profile Visibility") { selectedRuleType = "Profile Visibility" }
                    Button("Comment Permissions") { selectedRuleType = "Comment Permissions" }
                } label: {
                    HStack {
                        Text(selectedRuleType)
                            .foregroundColor(selectedRuleType == "Select" ? .gray : .black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                }
            }
            .padding(.horizontal, 16)

            // Set Rule
            VStack(alignment: .leading, spacing: 5) {
                Text("Set Rule")
                    .font(.custom("DMSans-Bold", size: 16))
                    .foregroundColor(.black)
                Menu {
                    Button("Allow All") { selectedRule = "Allow All" }
                    Button("Friends Only") { selectedRule = "Friends Only" }
                    Button("No One") { selectedRule = "No One" }
                } label: {
                    HStack {
                        Text(selectedRule)
                            .foregroundColor(selectedRule == "Select" ? .gray : .black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                }
            }
            .padding(.horizontal, 16)

            // Select Profiles
            VStack(alignment: .leading, spacing: 5) {
                Text("Select Profiles")
                    .font(.custom("DMSans-Bold", size: 16))
                    .foregroundColor(.black)
                Menu {
                    Button("Instagram") { selectedProfile = "Instagram" }
                    Button("Snapchat") { selectedProfile = "Snapchat" }
                    Button("Facebook") { selectedProfile = "Facebook" }
                    Button("Twitter") { selectedProfile = "Twitter" }
                } label: {
                    HStack {
                        Text(selectedProfile)
                            .foregroundColor(selectedProfile == "Select" ? .gray : .black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                }
            }
            .padding(.horizontal, 16)

            // Apply Rule Button
            Spacer()
            Button(action: {
                // Action for applying the rule
            }) {
                Text("APPLY RULE")
                    .font(.custom("DMSans-Bold", size: 18))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
            }
            .padding(.bottom, 20)
        }
        .navigationBarTitle("Create New Rule", displayMode: .inline)
    }
}

struct NewRulesView_Previews: PreviewProvider {
    static var previews: some View {
        NewRulesView()
    }
}
