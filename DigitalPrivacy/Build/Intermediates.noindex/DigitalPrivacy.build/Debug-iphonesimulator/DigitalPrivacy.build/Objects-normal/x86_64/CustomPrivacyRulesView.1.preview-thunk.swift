import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/arjunprabhune/Desktop/Classes/HCI/Digital-Privacy/DigitalPrivacy/DigitalPrivacy/CustomPrivacyRulesView.swift", line: 1)
import SwiftUI

struct CustomPrivacyRulesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text(__designTimeString("#2937_0", fallback: "Custom Privacy Rules"))
                .font(.custom(__designTimeString("#2937_1", fallback: "DMSans-Bold"), size: __designTimeInteger("#2937_2", fallback: 26)))
                .padding(.top, __designTimeInteger("#2937_3", fallback: 20))
                .padding(.leading, __designTimeInteger("#2937_4", fallback: 16))
            
            // List with Privacy Rules
            List {
                // Privacy Rules header with "+" button
                HStack {
                    Text(__designTimeString("#2937_5", fallback: "Privacy Rules"))
                        .font(.custom(__designTimeString("#2937_6", fallback: "DMSans-Bold"), size: __designTimeInteger("#2937_7", fallback: 18)))
                    Spacer()
                    Image(systemName: __designTimeString("#2937_8", fallback: "plus"))
                        .foregroundColor(.blue)
                }
                .padding(.vertical, __designTimeInteger("#2937_9", fallback: 8))

                // Content Sharing item
                HStack {
                    Image(systemName: __designTimeString("#2937_10", fallback: "square.and.arrow.up"))
                        .font(.title2)
                        .foregroundColor(.black)
                    Text(__designTimeString("#2937_11", fallback: "Content Sharing"))
                        .font(.custom(__designTimeString("#2937_12", fallback: "DMSans-Regular"), size: __designTimeInteger("#2937_13", fallback: 18)))
                    Spacer()
                    Image(systemName: __designTimeString("#2937_14", fallback: "chevron.right"))
                        .foregroundColor(.gray)
                }
                .padding(.vertical, __designTimeInteger("#2937_15", fallback: 8))

                // Activity Status item
                HStack {
                    Image(systemName: __designTimeString("#2937_16", fallback: "message.circle"))
                        .font(.title2)
                        .foregroundColor(.black)
                    Text(__designTimeString("#2937_17", fallback: "Activity Status"))
                        .font(.custom(__designTimeString("#2937_18", fallback: "DMSans-Regular"), size: __designTimeInteger("#2937_19", fallback: 18)))
                    Spacer()
                    Image(systemName: __designTimeString("#2937_20", fallback: "chevron.right"))
                        .foregroundColor(.gray)
                }
                .padding(.vertical, __designTimeInteger("#2937_21", fallback: 8))

                // Facial Recognition item
                HStack {
                    Image(systemName: __designTimeString("#2937_22", fallback: "faceid"))
                        .font(.title2)
                        .foregroundColor(.black)
                    Text(__designTimeString("#2937_23", fallback: "Facial Recognition"))
                        .font(.custom(__designTimeString("#2937_24", fallback: "DMSans-Regular"), size: __designTimeInteger("#2937_25", fallback: 18)))
                    Spacer()
                    Image(systemName: __designTimeString("#2937_26", fallback: "chevron.right"))
                        .foregroundColor(.gray)
                }
                .padding(.vertical, __designTimeInteger("#2937_27", fallback: 8))
            }
            .listStyle(InsetGroupedListStyle())
        }
        .navigationBarTitle(__designTimeString("#2937_28", fallback: "Custom Privacy Rules"), displayMode: .inline)
        .navigationBarBackButtonHidden(__designTimeBoolean("#2937_29", fallback: false)) // Ensures the back button is visible
    }
}

struct CustomPrivacyRulesView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPrivacyRulesView()
    }
}

