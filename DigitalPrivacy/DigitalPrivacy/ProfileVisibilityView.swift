import SwiftUI

struct ProfileVisibilityView: View {
    @State private var selectedOption = "Public"

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Profile Visibility")
                    .font(.custom("DMSans-Bold", size: 24))
                    .padding(.bottom, 20)

                Group {
                    ProfileVisibilityOption(title: "Public", isSelected: selectedOption == "Public") {
                        selectedOption = "Public"
                    }
                    ProfileVisibilityOption(title: "Friends Only", isSelected: selectedOption == "Friends Only") {
                        selectedOption = "Friends Only"
                    }
                    ProfileVisibilityOption(title: "Private", isSelected: selectedOption == "Private") {
                        selectedOption = "Private"
                    }
                    ProfileVisibilityOption(title: "Deactivate", isSelected: selectedOption == "Deactivate") {
                        selectedOption = "Deactivate"
                    }
                }
            }
            .padding()

            Spacer()

            Button(action: {
                print("Saved: \(selectedOption)")
            }) {
                Text("SAVE CHANGES")
                    .font(.custom("DMSans-Bold", size: 16))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255))
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Profile Visibility", displayMode: .inline)
    }
}

// ProfileVisibilityOption component (included within the same file for simplicity)
struct ProfileVisibilityOption: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("DMSans-Regular", size: 18))
                .foregroundColor(isSelected ? Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255) : .gray)
                .padding()
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color(red: 78 / 255, green: 60 / 255, blue: 219 / 255) : .gray, lineWidth: 2)
                )
        }
        .padding(.bottom, 10)
    }
}
