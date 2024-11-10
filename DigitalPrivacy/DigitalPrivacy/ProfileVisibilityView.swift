import SwiftUI

struct ProfileVisibilityView: View {
    @Binding var profileVisibility: String
    @Environment(\.presentationMode) var presentationMode // For dismissing the view
    @State private var showNotification = false // Show notification when changes are saved

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Profile Visibility")
                    .font(.custom("DMSans-Bold", size: 24))
                    .padding(.bottom, 20)

                Group {
                    ProfileVisibilityOption(title: "Public", isSelected: profileVisibility == "Public") {
                        profileVisibility = "Public"
                    }
                    ProfileVisibilityOption(title: "Friends Only", isSelected: profileVisibility == "Friends Only") {
                        profileVisibility = "Friends Only"
                    }
                    ProfileVisibilityOption(title: "Private", isSelected: profileVisibility == "Private") {
                        profileVisibility = "Private"
                    }
                    ProfileVisibilityOption(title: "Deactivate", isSelected: profileVisibility == "Deactivate") {
                        profileVisibility = "Deactivate"
                    }
                }
            }
            .padding()

            Spacer()

            Button(action: {
                // Save changes and show notification
                showNotification = true

                // Dismiss view after a short delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    presentationMode.wrappedValue.dismiss()
                }
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
        .overlay(
            Group {
                if showNotification {
                    NotificationView(message: "Profile visibility updated to \(profileVisibility)!")
                }
            }
        )
    }
}

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

struct NotificationView: View {
    let message: String

    var body: some View {
        Text(message)
            .font(.custom("DMSans-Bold", size: 16))
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .shadow(radius: 10)
            .frame(maxWidth: .infinity)
            .padding()
            .transition(.opacity)
            .animation(.easeInOut)
    }
}
