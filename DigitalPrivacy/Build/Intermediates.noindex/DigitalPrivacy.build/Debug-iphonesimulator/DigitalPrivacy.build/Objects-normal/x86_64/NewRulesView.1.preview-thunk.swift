import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/arjunprabhune/Desktop/Classes/HCI/Digital-Privacy/DigitalPrivacy/DigitalPrivacy/NewRulesView.swift", line: 1)
import SwiftUI

struct NewRulesView: View {
    // State variables to store selected options
    @State private var selectedRuleType: String = "Select"
    @State private var selectedRule: String = "Select"
    @State private var selectedProfile: String = "Select"
    
    var body: some View {
        VStack(alignment: .leading, spacing: __designTimeInteger("#4518_0", fallback: 20)) {
            // Title
            Text(__designTimeString("#4518_1", fallback: "Create New Rule"))
                .font(.custom(__designTimeString("#4518_2", fallback: "DMSans-Bold"), size: __designTimeInteger("#4518_3", fallback: 26)))
                .padding(.top, __designTimeInteger("#4518_4", fallback: 20))
                .padding(.leading, __designTimeInteger("#4518_5", fallback: 16))
            
            // Select Rule Type
            VStack(alignment: .leading, spacing: __designTimeInteger("#4518_6", fallback: 5)) {
                Text(__designTimeString("#4518_7", fallback: "Select Rule Type"))
                    .font(.custom(__designTimeString("#4518_8", fallback: "DMSans-Bold"), size: __designTimeInteger("#4518_9", fallback: 16)))
                    .foregroundColor(.black)
                Menu {
                    Button(__designTimeString("#4518_10", fallback: "Location")) { selectedRuleType = __designTimeString("#4518_11", fallback: "Location") }
                    Button(__designTimeString("#4518_12", fallback: "Profile Visibility")) { selectedRuleType = __designTimeString("#4518_13", fallback: "Profile Visibility") }
                    Button(__designTimeString("#4518_14", fallback: "Comment Permissions")) { selectedRuleType = __designTimeString("#4518_15", fallback: "Comment Permissions") }
                } label: {
                    HStack {
                        Text(selectedRuleType)
                            .foregroundColor(selectedRuleType == __designTimeString("#4518_16", fallback: "Select") ? .gray : .black)
                        Spacer()
                        Image(systemName: __designTimeString("#4518_17", fallback: "chevron.down"))
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: __designTimeInteger("#4518_18", fallback: 8)).stroke(Color.gray))
                }
            }
            .padding(.horizontal, __designTimeInteger("#4518_19", fallback: 16))

            // Set Rule
            VStack(alignment: .leading, spacing: __designTimeInteger("#4518_20", fallback: 5)) {
                Text(__designTimeString("#4518_21", fallback: "Set Rule"))
                    .font(.custom(__designTimeString("#4518_22", fallback: "DMSans-Bold"), size: __designTimeInteger("#4518_23", fallback: 16)))
                    .foregroundColor(.black)
                Menu {
                    Button(__designTimeString("#4518_24", fallback: "Allow All")) { selectedRule = __designTimeString("#4518_25", fallback: "Allow All") }
                    Button(__designTimeString("#4518_26", fallback: "Friends Only")) { selectedRule = __designTimeString("#4518_27", fallback: "Friends Only") }
                    Button(__designTimeString("#4518_28", fallback: "No One")) { selectedRule = __designTimeString("#4518_29", fallback: "No One") }
                } label: {
                    HStack {
                        Text(selectedRule)
                            .foregroundColor(selectedRule == __designTimeString("#4518_30", fallback: "Select") ? .gray : .black)
                        Spacer()
                        Image(systemName: __designTimeString("#4518_31", fallback: "chevron.down"))
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: __designTimeInteger("#4518_32", fallback: 8)).stroke(Color.gray))
                }
            }
            .padding(.horizontal, __designTimeInteger("#4518_33", fallback: 16))

            // Select Profiles
            VStack(alignment: .leading, spacing: __designTimeInteger("#4518_34", fallback: 5)) {
                Text(__designTimeString("#4518_35", fallback: "Select Profiles"))
                    .font(.custom(__designTimeString("#4518_36", fallback: "DMSans-Bold"), size: __designTimeInteger("#4518_37", fallback: 16)))
                    .foregroundColor(.black)
                Menu {
                    Button(__designTimeString("#4518_38", fallback: "Instagram")) { selectedProfile = __designTimeString("#4518_39", fallback: "Instagram") }
                    Button(__designTimeString("#4518_40", fallback: "Snapchat")) { selectedProfile = __designTimeString("#4518_41", fallback: "Snapchat") }
                    Button(__designTimeString("#4518_42", fallback: "Facebook")) { selectedProfile = __designTimeString("#4518_43", fallback: "Facebook") }
                    Button(__designTimeString("#4518_44", fallback: "Twitter")) { selectedProfile = __designTimeString("#4518_45", fallback: "Twitter") }
                } label: {
                    HStack {
                        Text(selectedProfile)
                            .foregroundColor(selectedProfile == __designTimeString("#4518_46", fallback: "Select") ? .gray : .black)
                        Spacer()
                        Image(systemName: __designTimeString("#4518_47", fallback: "chevron.down"))
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: __designTimeInteger("#4518_48", fallback: 8)).stroke(Color.gray))
                }
            }
            .padding(.horizontal, __designTimeInteger("#4518_49", fallback: 16))

            // Apply Rule Button
            Spacer()
            Button(action: {
                // Action for applying the rule
            }) {
                Text(__designTimeString("#4518_50", fallback: "APPLY RULE"))
                    .font(.custom(__designTimeString("#4518_51", fallback: "DMSans-Bold"), size: __designTimeInteger("#4518_52", fallback: 18)))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(__designTimeInteger("#4518_53", fallback: 10))
                    .padding(.horizontal, __designTimeInteger("#4518_54", fallback: 16))
            }
            .padding(.bottom, __designTimeInteger("#4518_55", fallback: 20))
        }
        .navigationBarTitle(__designTimeString("#4518_56", fallback: "Create New Rule"), displayMode: .inline)
    }
}

struct NewRulesView_Previews: PreviewProvider {
    static var previews: some View {
        NewRulesView()
    }
}

