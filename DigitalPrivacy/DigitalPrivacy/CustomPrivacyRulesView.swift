import SwiftUI

struct CustomPrivacyRulesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Custom Privacy Rules")
                .font(.custom("DMSans-Bold", size: 26))
                .padding(.top, 20)
                .padding(.leading, 16)
            
            // List with Privacy Rules
            List {
                // Privacy Rules header with "+" button
                HStack {
                    Text("Privacy Rules")
                        .font(.custom("DMSans-Bold", size: 18))
                    Spacer()
                    NavigationLink(destination: NewRulesView()) {
                        
                    }
                }
                .padding(.vertical, 8)

                // Content Sharing item
                HStack {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("Content Sharing")
                        .font(.custom("DMSans-Regular", size: 18))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)

                // Activity Status item
                HStack {
                    Image(systemName: "message.circle")
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("Activity Status")
                        .font(.custom("DMSans-Regular", size: 18))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)

                // Facial Recognition item
                HStack {
                    Image(systemName: "faceid")
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("Facial Recognition")
                        .font(.custom("DMSans-Regular", size: 18))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)
            }
            .listStyle(InsetGroupedListStyle())
        }
        .navigationBarTitle("Custom Privacy Rules", displayMode: .inline)
    }
}

